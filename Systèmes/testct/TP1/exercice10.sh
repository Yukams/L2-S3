#! /bin/sh

if [ ! $# -eq 2 ]
then
	echo "blabla 2 params" >&2
	exit 1
fi

expr $1 + 0 >/dev/null 2>/dev/null
echo $?
if [ $? -eq 2 -o $1 -lt 0 ]
then
	echo "blabla pas un nombre 1" >&2
	exit 2
fi

expr $2 + 0 >/dev/null 2>/dev/null
if [ $? -eq 2  -o $2 -lt 0 ]
then
	echo "blabla pas un nombre 2" >&2
	exit 3
fi

tail +6 liste.txt | sort -V -k 3 | head -1 | cut -f1 -d " "
tail +6 liste.txt | sort -V -k 3 | tail -1 | cut -f1 -d " "

tail +6 liste.txt | sort -V -k 3 | cut -f1 -d " " | grep ".\{$1\}" | grep -vc ".\{$2\}"

exit 0
