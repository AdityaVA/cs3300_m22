#!/bin/bash

if [[ $# == 0 ]]
then
    echo "use -h flag for help"
    exit
fi

if [[ $# == 1 && $1 == "-h" ]]
then
    echo "USAGE: make sure input, ouput folder and script are in P2 folder"
    echo ""
    echo "./run.sh <files> [OPTIONAL]"
    echo ""
    echo "files:"
    echo "all                   : run all files"
    echo "<file_name>           : run a single file"
    echo ""
    echo "OPTIONAL:"
    echo "debug                 : run in debug mode, from line number 1"
    echo "debug <line_number>   : run in debug mode from a specific line"
    echo ""
    echo "debug mode:"
    echo "1) It will execute file(s) in sequential order and stops as soon as one gives wrong output."
    echo "2) It will print the correct output for that file and also output of your code."
    echo "3) It will print the smallest line number where your code is giving wrong output."
    echo "4) You can give a line_number as an argument to start debugging from that line."
    echo ""
    echo "run script with --debug-help flag for more info"
    exit
fi
if [[ $# == 1 && $1 == "--debug-help" ]]
then
    echo "1) Run file with line number 1 first to get to know which function gives wrong output in main."
    echo ""
    echo "2) Then run file with line number of that function to get to know which line in that function gives wrong output."
    echo ""
    echo "3) It will not work if there are jumps in the function tho :("
    exit
fi

cd input/
fname=$(ls *.java)
cd ../

javac P2.java

echo "--------------------------------------------------------"
if [[ $1 == "all" ]]
then
    for f in $fname
    do
        echo "Processing $f"
        name=$(basename $f .java)
        java P2 < input/$f > output/IR/mine/$name.microIR 2>/dev/null
        cd input/
        javac $f
        java $name > ../output/exec/correct/$name 2>/dev/null
        cd ../
        java -jar pgi.jar < output/IR/mine/$name.microIR 1>output/exec/mine/$name 2>/dev/null
        if [[ $(cat output/exec/correct/$name) != $(cat output/exec/mine/$name) ]]
        then
            echo "----->" "sed "
            if [[ $2 == "debug" ]]
            then
                echo "correct: "
                echo $(cat output/exec/correct/$name) 
                echo "--------------------------------------------------------"
                echo "mine"
                echo $(cat output/exec/mine/$name)
                if grep -Fxq "parseException" output/exec/mine/$name
                then
                    code -g output/IR/mine/$name.microIR
                else
                    len=$(cat output/IR/mine/$name.microIR | wc -l)
                    start=2
                    if [[ $# == 3 ]]
                    then
                        start=$(($3+1))
                    fi
                    for i in $(seq $start $len)
                    do
                        echo $(head -n $i output/IR/mine/$name.microIR) "PRINT 69" $(tail -n +$(($i+1)) output/IR/mine/$name.microIR) > output/tmpInput.microIR
                        java -jar pgi.jar < output/tmpInput.microIR 1> output/tmpOutput 2>/dev/null
                        if grep -Fxq "69" output/tmpOutput
                        then
                            i=$i
                        else
                            echo "--------------------------------------------------------"
                            echo "Error at line $i"
                            echo "--------------------------------------------------------"
                            code -r input/$name.java
                            code -g output/IR/mine/$name.microIR:$i
                            break
                        fi
                    done
                fi
                rm output/tmpInput.microIR output/tmpOutput
                break
            else
                echo "--------------------------------------------------------"
            fi
        else
            echo "----->" "Noice"
            echo "--------------------------------------------------------"
        fi
    done
else
    echo "Processing $1"
    name=$(basename $1 .java)
    java P2 < input/$1 > output/IR/mine/$name.microIR
    cd input/
    javac $1
    java $name > ../output/exec/correct/$name 2>/dev/null
    cd ../
    java -jar pgi.jar < output/IR/mine/$name.microIR 1> output/exec/mine/$name 2>/dev/null
    if [[ $(cat output/exec/correct/$name) != $(cat output/exec/mine/$name) ]]
    then
        echo "----->" "sed "
        if [[ $2 == "debug" ]]
        then
            echo "correct: "
            echo $(cat output/exec/correct/$name) 
            echo "--------------------------------------------------------"
            echo "mine"
            echo $(cat output/exec/mine/$name)
            if grep -Fxq "parseException" output/exec/mine/$name
            then
                code -g output/IR/mine/$name.microIR
            else
                len=$(cat output/IR/mine/$name.microIR | wc -l)
                start=2
                if [[ $# == 3 ]]
                then
                    start=$(($3+1))
                fi
                for i in $(seq $start $len)
                do
                    echo $(head -n $i output/IR/mine/$name.microIR) "PRINT 69" $(tail -n +$(($i+1)) output/IR/mine/$name.microIR) > output/tmpInput.microIR
                    java -jar pgi.jar < output/tmpInput.microIR 1> output/tmpOutput 2>/dev/null
                    if grep -Fxq "69" output/tmpOutput
                    then
                        i=$i
                    else
                        echo "--------------------------------------------------------"
                        echo "Error at line $i"
                        echo "--------------------------------------------------------"
                        code -r input/$1
                        code -g output/IR/mine/$name.microIR:$i
                        break
                    fi
                done
                rm output/tmpInput.microIR output/tmpOutput
            fi
        else
            echo "--------------------------------------------------------"
        fi
    else
        echo "----->" "Noice"
        echo "--------------------------------------------------------"
    fi
fi

cd input/
find . -name "*.class" | xargs rm
cd ../ 