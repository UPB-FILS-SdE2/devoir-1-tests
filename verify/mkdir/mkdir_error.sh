#!/bin/bash
# 5

outputfile=$1
testfile=$2

DIR=`pwd`

rm -rf /bla

rustybox mkdir /bla/bla/bla &> $outputfile
scriptresult=$?

if [ $scriptresult != 226 ]
then
    echo "Command does not fail with exit code -30." > $testfile
    exit -1 
fi

exit 0