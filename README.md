# Strong (app) Exports

String to export Strong data

## Stronger by Science

Produces a CSV for the SBS spreadsheet with reps, loads and RIRs (script translates RPEs to RIRs). 

The script requires the Strong account export data file and the earliest date to export.

### Example

Running the program:
```
> ruby sbs.rb YYYY-MM-DD < data.txt
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
