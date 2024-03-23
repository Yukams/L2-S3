#! /bin/sh

while [ $# -gt 0 ]
do
	if [ ! -f $1 -o ! -r $1 ]
	then
		echo "$1 inaccessible" >&2
		exit 1
	fi
	cat $1
	shift
done
