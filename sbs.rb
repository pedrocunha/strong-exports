require 'csv'

date = ARGV[0]
if date.nil?
  puts "date is blank"
  exit
end
date = Date.parse(date)

# select the rows that are after a given date
relevant = []
input = CSV.parse($stdin.read, headers: true)
input.each do |row|
  workout_date = Date.parse(row["Date"])
  if workout_date >= date
    relevant << row
  end
end

# group the rows by workout name and exercise name
groups = relevant.group_by do |row|
  [row["Workout Name"], row["Exercise Name"]]
end

def format_number(n)
  i, f = n.to_i, n.to_f
  i == f ? i : f
end

# generate a CSV to be imported outside of this script
output = CSV.generate(headers: false, force_quotes: true) do |csv|
  groups.each do |(workout_name, exercise_name), rows|
    exercise = []
    exercise << workout_name
    exercise << exercise_name
    exercise << rows.map { |r| r["Reps"] }.join(",")

    exercise << rows.map do |r|
      weight = r["Weight"].to_f
      weight == 0 ? nil : format_number(weight)
    end.compact.join(",")

    exercise << rows.map do |r|
      next unless r["RPE"]
      10 - r["RPE"].to_i
    end.compact.join(",")

    csv << exercise
  end
end

puts output
