#! /bin/sh

if [ ! -f "$1" -o ! -r "$1" ]
	then echo "$1 n'est pas un fichier ou n'est pas accessible en lecture">&2
	exit 2
fi

if [ $# -eq 1 ]
	then echo "Un seul paramètre"
	nblignes=`grep -c '.*' $1`
	echo $nblignes
	
	while [ $nblignes -gt 0 ]
		do
        #echo $nblignes
		head -$nblignes $1 >> .inv1
        tail -1 .inv1 >> .inv2
        nblignes=`expr $nblignes - 1`
		done
    cat .inv2 > $1
    rm .inv1
    rm .inv2

elif [ $# -eq 2 ]
	then cat $1 > $2
	./$0 $2
	
else
	echo "Erreur : $0 nom_fichier1 [nom_fichier2]">&2
	exit 1
fi

exit 0
