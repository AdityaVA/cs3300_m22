#!/bin/sh
if [[ $# == 2 ]] && [[ $2 == "-nc" ]]; then
java -jar kgi.jar < out.RA
else 
find . -name "*.class" | xargs rm 
javac P4.java
java P4 < tests/input/IR/$1.microIR >out.RA
java -jar kgi.jar < out.RA
fi