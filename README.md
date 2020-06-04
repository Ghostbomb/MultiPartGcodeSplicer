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


## Features
*Features that might need some explanation*
### Multi Exporter
This is a function that is able to export multiple files. Useful when troubleshooting GCODE setting and prints keep failing or when you have many spools of filament with varying amounts of filament on each. This function, if enabled, will export multiple GCODE files without you having to export them one by one. You can set # to max number of parts to come out of 1kg spool and export multiple GCODE files.

With the function OFF it will only export 1 file. Ex: name = RC3_PLA, # = 7
```
RC3_PLAx7.gcode
```
With the function ON it will export # number of files. Ex: name = RC3_PLA, # = 7
```
RC3_PLAx1.gcode // prints 1 parts
RC3_PLAx2.gcode // prints 2 parts
RC3_PLAx3.gcode // prints 3 parts
RC3_PLAx4.gcode // prints 4 parts
RC3_PLAx5.gcode // prints 5 parts
RC3_PLAx6.gcode // prints 6 parts
RC3_PLAx7.gcode // prints 7 parts
```
or  Ex: name = RC3_PLA, # = 3
```
RC3_PLAx1.gcode // prints 1 parts
RC3_PLAx2.gcode // prints 2 parts
RC3_PLAx3.gcode // prints 3 parts
```
