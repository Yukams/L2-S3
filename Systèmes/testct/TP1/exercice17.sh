#! /bin/sh

afficher_arbre()
{
	for elem in `ls -l $1 | grep "^d" | tr -s "\t" " " | cut -f9 -d " "`
	do
		echo "$2$elem"
		nbDir=`ls $1 | grep -c ""`
		if [ $nbDir -gt 0 ]
		then
			afficher_arbre "$1/$elem" "$2  "
		fi
	done
}

if [ $# -ne 1 ]
then
	echo "Usage : $0 directory_name" >&2
	exit 1
fi

if [ ! -d $1 -o ! -r $1 -o ! -x $1 ]
then
	echo "Directory invalid" >&2
	exit 2
fi

echo $1
afficher_arbre $1
exit 0
