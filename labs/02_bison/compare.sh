#!/bin/bash
rm -r difference
mkdir difference
for filename in ../../assignments/01_macro_to_mini/mini_java_examples/*.java
do
 out1= $filename   
 out2="output/$(basename "$filename" .java)_out.java" 
  echo $out1
 diff  -w $out1  $out2 > "difference/$(basename "$filename" .java)_diff.txt"
done