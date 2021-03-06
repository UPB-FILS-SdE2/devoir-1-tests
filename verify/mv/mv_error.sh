#!/bin/bash
# 5

outputfile=$1
testfile=$2

rm -rf /bla

rustybox mv /bla/bla/bla file &> $outputfile
scriptresult=$?

if [ $scriptresult != 216 ]
then
    echo "Command does not fail with exit code -40." > $testfile
    exit -1 
fi

exit 0