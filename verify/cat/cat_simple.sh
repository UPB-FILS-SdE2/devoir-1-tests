#!/bin/bash
# 5

outputfile=$1
testfile=$2

rm -rf output/*

rustybox cat /etc/passwd &> $outputfile
scriptresult=$?

if [ $scriptresult == 0 ]
then
    diff -q /etc/passwd $outputfile &> $testfile
    testresult=$?

    rm -rf output/*

    if [ $testresult != 0 ]
    then
        echo "Incorrect output."
        exit -1
    fi
else
    rm -rf output/*
    echo "Command does not return 0." > $testfile
    exit -1
fi