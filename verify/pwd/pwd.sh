#!/bin/bash
# 5

outputfile=$1
testfile=$2

rustybox pwd &> $outputfile
scriptresult=$?
pwd > $testfile
testresult=$?

diff -q $outputfile $testfile
if [ $? != 0 ]
then
    echo 'pwd does not print the current working directory. Check output below.' > $testfile
    exit -1 
fi

if [ $scriptresult != $testresult ]
then
    echo "Echo does not return $testresult exit code." > $testfile
    exit -1  
fi

exit 0