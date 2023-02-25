require 'date'
require 'csv'

SET_REGX = /^Set \d+: (?<weight>\d+.?\d*) kg × (?<reps>\d+) @ (?<rpe>\d+)/.freeze
SET_WITHOUT_RPE_REGX = /^Set \d+: (?<weight>\d+.?\d*) kg × (?<reps>\d+)/.freeze
SET_ONLY_REPS_REGX = /^Set \d+: (?<reps>\d+) reps/.freeze

input = $stdin.read.split("\n").reject(&:empty?)

i        = 0
name     = nil
date     = nil
exercise = nil
result   = []

while i < input.length
  if input[i] =~ /^https:/ # end of day workout
    name     = nil
    date     = nil
    exercise = nil

    i += 1 and next
  end

  if name.nil? && date.nil?
    name = input[i]
    date = input[i + 1]
    i += 2 and next
  end

  next if exercise

  exercise = input[i]
  info = {
    name: name,
    date: date,
    exercise: exercise,
    loads: [],
    reps: [],
    rpes: []
  }

  i += 1
  loop do
    matches = input[i].match(SET_REGX)
    if matches
      info[:loads] << matches[:weight]
      info[:reps]  << matches[:reps]
      info[:rpes]  << matches[:rpe]
      i += 1 and next
    end

    matches = input[i].match(SET_WITHOUT_RPE_REGX)
    if matches
      info[:loads] << matches[:weight]
      info[:reps]  << matches[:reps]
      i += 1 and next
    end

    matches = input[i].match(SET_ONLY_REPS_REGX)
    if matches
      info[:reps] << matches[:reps]
      i += 1 and next
    end

    result << info
    exercise = nil
    break
  end
end

out = CSV.generate(force_quotes: true) do |csv|
  result.each do |entry|
    csv << [
      entry.fetch(:name),
      entry.fetch(:exercise),
      entry.fetch(:reps).join(','),
      entry.fetch(:loads).join(','),
      entry.fetch(:rpes).map { |r| 10 - r.to_i }.join(',')
    ]
  end
end
puts out
