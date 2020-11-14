#!/bin/bash

mode="addition"
temp=1
(tail -f channel) | while true
do
read line
case $line in
"+")
	mode="addition"
	echo $mode
;;
"*")
	mode="multiplication"
	echo $mode
;;
[0-9]*)
	case $mode in
		"addition")
			let "temp = temp + line"
			echo $temp
			;;
		"multiplication")
			let "temp = temp * line"
			echo $temp
			;;
	esac
	;;
"quit")
	killall tail
	echo "End"
	killall 5generator.sh
	exit
;;
*)
	killall tail
	echo "You input wrong value"
	killall 5generator.sh
	exit
;;
esac
done
