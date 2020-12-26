#!/bin/bash

path=$1
command=$2
name=$(basename $path)
gitPath=~/.git

case $command in
"check")
;;
"recover")
;;
*)
	echo "Unknown command"
	exit 1
;;
esac

if [ $# != 2 ];
then
	exit 1
fi

if [ ! -d "$gitPath" ];
then
	mkdir $gitPath
fi

if [ ! -e "$path" ];
then
	echo "File doesn't exist"
	exit 1
fi

if [[ $command == "check" ]]
then
	if [[ -e $gitPath"/"$name ]]
	then
		cFile=$gitPath"/"$name
		if [[ -e $gitPath"/."$name".logcnt" ]]
		then
			count=$(cat $gitPath"/."$name".logcnt")
		else
			count=0
		fi
		((count++))
		echo $count > $gitPath"/."$name".logcnt"
		echo "$count)" >>  $gitPath"/"$name".log"
		grep -v -F -x -f $cFile $path >> $gitPath"/"$name".log"
	else
		cp $path $gitPath"/"$name
	fi
else
	if [[ -e $gitPath"/"$name ]]
	then
		rm -R $path
		ln $gitPath"/"$name $path
	else
		echo "File doesn't exist"
	fi
fi
