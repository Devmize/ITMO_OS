#!/bin/bash

date=$(ls ~ | grep -E "^Backup-" | sort -n -r | head -1 | sed "s/Backup-//")
lb=~/Backup-$date

cdate=$(date + "%F")
cdatefrom1970=$(date -d "$cdate" + "%s")
lbdatefrom1970=$(date -d $lb + "%s")
time_dif=$(echo

