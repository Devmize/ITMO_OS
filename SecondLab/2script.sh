#!/bin/bash

for i in $(ls /proc | grep "[0-9]")
do
if [[ "$(readlink /proc/$i/exe)" =~ /usr/sbin.*$ ]]
then
echo $i >> secondTask.txt
fi
done
