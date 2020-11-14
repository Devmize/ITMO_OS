#!/bin/bash

while true
do
read line
if [[ "$line" == "TERM" ]]
then
	kill -SIGTERM $(cat tempPid)
	exit
fi
if [[ "$line" == "+" ]]
then
	kill -USR1 $(cat tempPid)
	continue
fi
if [[ "$line" == "*" ]]
then
	kill -USR2 $(cat tempPid)
	continue
fi
done
