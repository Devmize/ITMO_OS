#!/bin/bash

let maxNumber=$1
for i in $2 $3
do
if [[ $maxNumber -lt $i ]]
then
maxNumber=$i
fi
done

echo $maxNumber

exit
