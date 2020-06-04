# MultiPartGcodeSplicer
## Summary

The basic function of the app copies and pastes GCODE code multiple time to create a 1 large GCODE file that will print multiple parts. I have setup so that it will paste the First GCODE file which will be one that prints a intro line(wipe function), then pastes the repeated GCODE which doesn't inlaced an intro line.

## Basic Function of the App
```
Copy Contents of FIRST_GCODE then paste to OUTPUT_FILE

repeat for I number of times {  Copy Contents of REPEAT_GCODE and append to OUTPUT_FILE  }
```

## Releases
https://github.com/Ghostbomb/MultiPartGcodeSplicer/releases
