#!/bin/bash

(
max=0
pid=0
for i in $(ls /proc | grep "[0-9]")
do
	tempMem=$(awk '$1 == "VmSize:" {print $2}' /proc/$i/status)
		if [[ "tempMem" -gt "$max" ]];
		then
			let max=$tempMem
			let pid=$i
		fi
done
echo "Max: $pid"
top -b -o +VIRT | head -n 8 | tail -n  2
) 2> /dev/null
