#!/bin/bash

mkdir -p chest

if [ "$1" == "all" ]
then
for i in chest/name*.log
do
cat "$i"
cat $(echo $i | sed 's/name//')
done
exit 0
fi

if [ "$1" != "" ]
then
cat chest/name$1.log
cat chest/$1.log
exit 0
fi

i=0
date=$(date "+%Y-%m-%dT%H:%M:%S")
for type in $(ps -aux | sed '1d' | awk '{print $2" "$11" "$5}')
do
if [ $i -eq 0 ]
then
pid=$type
else
if [ $i -eq 1 ]
then
name=$type
else
mem=$type
echo "$name" > chest/name$pid.log
echo "$date $mem" >> chest/$pid.log
fi
fi
let i=($i+1)%3
done
