#!/bin/bash

file=$1
num=0

if [ $# != 1 ];
then
	exit 1
fi

if [ ! -d ~/.trash ];
then
	mkdir ~/.trash
fi

if [ ! -f ~/.trash.log ];
then
	touch ~/.trash.log
fi

name=$file-$num
while [ -f ~/.trash/$name ];
do
	(( num++ ))
	name=$file-$num
done

ln $file ~/.trash/$name
rm $file && echo $(realpath $file) $name >> ~/.trash.log
