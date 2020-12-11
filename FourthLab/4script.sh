#!/bin/bash

date=$(ls ~ | grep -e "^Backup-" | sort -n -r | head -1 | sed "s/^Backup-//")
lb=~/Backup-$date

if [ ! -z $date ];
then
	if [ ! -d ~/restore ];
	then
		mkdir ~/restore
	fi

	for file in $(ls $lb | grep -E -v "[0-9]{4}-[0-9]{2}-[0-9]{2}");
	do
		cp $lb/$file ~/restore/$file
	done
fi
