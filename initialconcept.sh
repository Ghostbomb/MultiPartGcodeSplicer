#!/bin/sh
echo "First Gcode:"
read first_gcode
echo "Repeat Gcode:"
read repeat_gcode
echo "Output File:"
read output_gcode
echo "Number of Part to Print:"
read xnumparts

cat $first_gcode > $output_gcode


for ((n=0;n<$xnumparts-1;n++))
do
 cat $repeat_gcode >> $output_gcode
echo "repeat"
done
