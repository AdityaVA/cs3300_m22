#!/bin/bash
javac P1.java
# rm -r output
# mkdir output
for filename in ../../sample_minijava/final/*.java
do
 java P1< $filename> "output/final/$(basename "$filename" .java)_out.txt"
#   if [[ $(cat output/$(basename "$filename" .java)_out.txt) != "Program type checked successfully" ]]
#     then
#         echo "----->" "sed: " $(cat $(basename "$filename" .java)_out.txt)
#     else
#         echo "----->" "Noice"
#   fi
done