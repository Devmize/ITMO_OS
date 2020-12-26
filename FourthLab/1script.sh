#!/bin/bash

file=$1
num=0

case $file in
*\ *)
echo "Enter file without spaces"
exit 1
;;
esac

if [ ! -f $file ];
then
	echo "File doesn't exist"
	exit 1
fi

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
