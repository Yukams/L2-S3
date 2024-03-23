#! /bin/sh

if [ ! $# -eq 1 ]
then
    echo "Usage : $0 nom_de_fichier">&2
    exit 1
fi

if [ ! -d "$1" -o ! -r "$1" -o ! -x "$1" ]
then
    echo "$1 n'est pas un répertoire ou n'est pas traversable ou pas accessible en lecture"
    exit 2
fi

value=0
for sous_rep in "$1"/*
do
    if [ -d "$sous_rep" -a -r "$sous_rep" -a -x "$sous_rep" ]
    then
        basename /Users/valentin/Desktop/Fac/L2/S3/Systèmes/TP5/$sous_rep
        sh "$0" $sous_rep
    fi
done
