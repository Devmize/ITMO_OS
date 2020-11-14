#!/bin/bash

echo $$ > tempPid
temp=1

term() {
echo "Stop processing by generator."
exit
}

usr1() {
let "temp = temp + 2"
}

usr2() {
let "temp = temp * 2"
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM

while true
do
sleep 1
echo $temp
done
