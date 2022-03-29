#!/bin/bash
# 10

outputfile=$1
testfile=$2

rm -rf output
mkdir output

rustybox cp -r /etc/passwd output &> $outputfile
scriptresult=$?

ls output/passwd &> $testfile
testresult=$?

if [ $testresult == 0 ]
then
    diff -q /etc/passwd output/passwd
    testresult=$?
    
    rm -f output/passwd

    if [ $testresult == 0 ]
    then
        if [ $scriptresult != 0 ]
        then
            echo "Correct cp command does not return 0 exit code." > $testfile
            exit -1 
        fi
    else
        echo "Destination file is different from output file." > $testfile
    fi
    exit $testresult

else
    rm -f output/passwd
    echo "Destination file does not exist." > $testfile
    exit -1
fi