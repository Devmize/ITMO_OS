#!/bin/bash

dirFile=$1
file=$2

if [[ $file =~ [a-zA-Z\.] ]]
then
cd $dirFile
touch $file
else
echo "Error"
exit
fi
