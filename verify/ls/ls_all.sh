#!/bin/bash
# 20

outputfile=$1
testfile=$2

rm -rf lstest

mkdir lstest
touch lstest/modern
touch lstest/family
mkdir lstest/gloria
touch lstest/.hidden

# echo "modern" > output/ls_out
# echo "family" >> output/ls_out
# echo "gloria" >> output/ls_out
# echo ".hidden" >> output/ls_out
# echo "." >> output/ls_out
# echo ".." >> output/ls_out

ls -a `pwd`/lstest > output/ls_out

rustybox ls -a `pwd`/lstest &> $outputfile
scriptresult=$?

node verify/ls/ls.js output/ls_out $outputfile a > $testfile 2>> $outputfile
testresult=$?

rm -rf lstest
rm -f output/ls_out

if [ $testresult == 0 ]
then
    if [ $scriptresult != 0 ]
    then
        echo "Correct ls does not return 0 exit code." > $testfile
        exit -1 
    fi
fi

exit $testresult


