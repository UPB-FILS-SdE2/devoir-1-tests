#!/bin/bash
# 5

outputfile=$1
testfile=$2

rustybox echo -n loremipsum &> $outputfile
scriptresult=$?
echo -n loremipsum > $testfile
testresult=$?
diff -q $outputfile $testfile

if [ $? != 0 ]
then
    echo 'echo -n does not remove newline character. Check output below.' > $testfile
    exit -1 
fi

if [ $scriptresult != $testresult ]
then
    echo "Echo does not return $testresult exit code." > $testfile
    exit -1  
fi

exit 0