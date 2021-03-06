#!/bin/bash
# 5

outputfile=$1
testfile=$2

rm -rf futurama

mkdir futurama
touch futurama/bender

rustybox rmdir futurama &> $outputfile
scriptresult=$?

rm -rf futurama

if [ $scriptresult != 196 ]
then
    echo "Command does not fail with exit code -60 when trying to delete a folder that is not empty." > $testfile
    exit -1 
fi

exit 0


