#!/bin/bash
make assgn.exe
rm -r output
mkdir output
for filename in ../../assignments/01_macro_to_mini/macro_java_examples/*.java
do
 ./assgn.exe< $filename> "output/$(basename "$filename" .java)_out.java"
done