#!/bin/bash

ffile=$1

restore() {
path=$1
file=$2
ln ~/.trash/$file $path
}

if [ $# != 1 ];
then
	exit 1
fi

if [ ! -d ~/.trash ];
then
	exit 1
fi

if [ ! -f ~/.trash.log ];
then
	exit 1
fi

if [ -z $(grep $ffile -r ~/.trash) ];
then
	exit 1
fi

grep $ffile ~/.trash.log | while read fp;
do
	f=$(echo $fp | cut -d " " -f 1)
	t=$(echo $fp | cut -d " " -f 2)

	echo "Restore $t ? (y/n)"

	read answer < /dev/tty
	if [ $answer == "y" ];
	then
		dir=$(dirname $f) &&
		if [ -d $dir ];
		then
			$(restore $f $t)
		else
			$(restore $HOME/$ffile $t) && echo "Restored in $HOME"
		fi $$
		rm ~/.trash/$t && {
			sed -i "#$fp#d" ~/.trash.log
			echo "Restored $f"
		}
	fi
done
