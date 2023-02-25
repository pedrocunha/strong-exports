# Strong (app) Exports

Collection of scripts to export data from Strong

## Stronger by Science

Produces a CSV for the SBS spreadsheet with reps, loads and RIRs (script translates RPEs to RIRs).

### Example

Given a text file composed by "share" > "copy" for each workout in Strong:
```
Upper 1
Monday, 20 February 2023 at 08:30

Bench Press (Dumbbell)
Set 1: 42 kg × 8 @ 9
Set 2: 42 kg × 7 @ 9
Set 3: 42 kg × 6 @ 9

Seated Row (Cable)
Set 1: 62 kg × 9 @ 8
Set 2: 62 kg × 9 @ 9
Set 3: 62 kg × 9 @ 9

Lateral Raise (Cable)
Set 1: 3.75 kg × 13 @ 8
Set 2: 3.75 kg × 13 @ 8
Set 3: 3.75 kg × 12 @ 8
Set 4: 3.75 kg × 10 @ 9

Preacher Curl (Barbell)
Set 1: 27.5 kg × 10 @ 8
Set 2: 27.5 kg × 8 @ 8
Set 3: 27.5 kg × 8 @ 8
Set 4: 27.5 kg × 7 @ 9

Triceps Pushdown (Cable - Straight Bar)
Set 1: 31.25 kg × 12 @ 8
Set 2: 31.25 kg × 11 @ 9
Set 3: 31.25 kg × 11 @ 9
https://strong.app.link/Wq0H31HiIxb

Lower 1
Wednesday, 22 February 2023 at 17:42

Leg Press
Set 1: 260 kg × 7 @ 8
Set 2: 260 kg × 7 @ 9
Set 3: 260 kg × 6 @ 8

Stiff Leg Deadlift (Barbell)
Set 1: 60 kg × 13 @ 8
Set 2: 60 kg × 13 @ 8
Set 3: 60 kg × 12 @ 8

Leg Extension (Machine)
Set 1: 65 kg × 14 @ 8
Set 2: 65 kg × 13 @ 8
Set 3: 65 kg × 13 @ 8
Set 4: 65 kg × 13 @ 8

Seated Calf Raise (Smith Machine)
Set 1: 100 kg × 15 @ 7
Set 2: 100 kg × 14 @ 8
Set 3: 100 kg × 15 @ 8

Dragon Flags
Set 1: 5 reps
Set 2: 4 reps
Set 3: 4 reps
https://strong.app.link/kuFLj9JiIxb
```

Running the program:
```
> ruby sbs.rb < data.txt
"Upper 1","Bench Press (Dumbbell)","8,7,6","42,42,42","1,1,1"
"Upper 1","Seated Row (Cable)","9,9,9","62,62,62","2,1,1"
"Upper 1","Lateral Raise (Cable)","13,13,12,10","3.75,3.75,3.75,3.75","2,2,2,1"
"Upper 1","Preacher Curl (Barbell)","10,8,8,7","27.5,27.5,27.5,27.5","2,2,2,1"
"Upper 1","Triceps Pushdown (Cable - Straight Bar)","12,11,11","31.25,31.25,31.25","2,1,1"
"Lower 1","Leg Press","7,7,6","260,260,260","2,1,2"
"Lower 1","Stiff Leg Deadlift (Barbell)","13,13,12","60,60,60","2,2,2"
"Lower 1","Leg Extension (Machine)","14,13,13,13","65,65,65,65","2,2,2,2"
"Lower 1","Seated Calf Raise (Smith Machine)","15,14,15","100,100,100","3,2,2"
"Lower 1","Dragon Flags","5,4,4","",""
```
