#!/bin/bash

rm fifthTast.txt
for i in $(cat fourthTask.txt | awk '{print $7}' | uniq)
do
	let count=0 art=0 avg=0
	for j in $(grep "ProcessID = $i" fourthTask.txt | awk '{print $11}')
	do
		art=$(bc<<<"$art + $i")
		let "count+=1"
	done
let "avg=$art/$count"
grep "Parent_ProcessID = $i" fourthTask.txt | sed "s/$/ : Average_Sleeping_Children_of_ParentID = $i is $avg/" >> fifthTask.txt
done
