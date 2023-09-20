#!/bin/bash
make assgn.exe
rm -r negative_output
mkdir negative_output
for filename in ../../testcases/negative/*.java
do
 ./assgn.exe< $filename> "negative_output/$(basename "$filename" .java)_out.java"
done
rm -r positive_output
mkdir positive_output
for filename in ../../testcases/positive/*.java
do
 ./assgn.exe< $filename> "positive_output/$(basename "$filename" .java)_out.java"
done