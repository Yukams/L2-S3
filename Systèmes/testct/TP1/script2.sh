#! /bin/sh

if [ ! $# -eq 1 ]
then
	echo "Error : script2.sh directory_to_delete" >&2
	exit 1
fi

if [ ! -d $1 ]
then
	echo "Error : no directory with this name" >&2
	exit 2
fi

rm -dr `ls $1/*`
rmdir $1
