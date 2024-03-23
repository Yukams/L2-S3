#! /bin/sh

if [ $# -gt 2 -o $# -eq 0 ]
then
    echo "Usage : $0 file_name [char_chain]">&2
    exit 1
fi

if [ ! -d "$1" -o ! -r "$1" -o ! -x "$1" ]
then
     echo "$1 n'est pas un répertoire ou n'est pas traversable ou n'est pas accessible en lecture">&2
     exit 2
fi

if [ $# -eq 1 ]
then
    echo "$1"
    "$0" $1 ""
fi

if [ $# -eq 2 ]
then
    sum=`ls -Al $1 | grep -c '^d'`
    for sous_rep in "$1"/*
    do
        if [ -d "$sous_rep" -a -r "$sous_rep" -a -x "$sous_rep" ]
        then
             echo "$2+- $sous_rep"
             if [ $sum -eq 1 ]
             then
                 "$0" $sous_rep "$2   "
             else
                 "$0" $sous_rep "$2|  "
             sum=`expr $sum - 1`
             fi
         fi
    done
fi
