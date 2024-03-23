#! /bin/sh

if [ ! $# -eq 2 ]
then 
	echo "Error : script.sh directory_name file_to_copy" >&2
	exit 1
fi

if [ -d $1 ]
then
	echo "Error : directory already existing with this name"
	exit 2
fi

if [ ! -f $2 ]
then
	echo "Error : not an existing file name" >&2
	exit 3
fi

mkdir $1
cp $2 $1/
exit 0
