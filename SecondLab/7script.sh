#!/bin/bash

let sec=0
(
rm buffer_proc*
for i in $(ls /proc | grep "[0-9]")
do
	awk '$1 == "read_bytes:" {printf "%d ", $2}' /proc/$i/io >> buffer_proc_first.info
	cmd=$(ps -eo pid,cmd | awk -v id=$i '$1 == id {print $2}')
	echo $i $cmd >> buffer_proc_first.info
done
sleep 5 #60
for i in $(ls /proc | grep "[0-9]")
do
	awk '$1 == "read_bytes:" {printf "%d ", $2}' /proc/$i/io >> buffer_proc_second.info
	echo $i >> buffer_proc_second.info
done

while read s
do
	pid=$(echo $s | awk '{print $2}')
	mem=$(echo $s | awk '{print $1}')
	awk -v p=$pid -v m=$mem '{
		if($2 == p)
		{
			printf "PID %d : Delta %d : ", $2, m-$1
			print $3
		}
	}' buffer_proc_first.info >> buffer_proc_answer.info
done < buffer_proc_second.info
sort -n -k 8 buffer_proc_answer.info | tail -n 3

rm buffer_proc*
) 2> /dev/null
