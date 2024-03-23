#! /bin/sh

if [ $# -eq 1 ]
then
    expr $1 + 0 >/dev/null 2>&1
    if [ $? -gt 0 ]
    then
        echo "Usage : N should be a number" >&2
        exit 2
    fi
else
    echo "Usage : $0 N" >&2
    exit 1
fi

successeur=$$
N=$1
while [ $N -gt 1 ]
do
    N=`expr $N - 1`
    ./maillon.sh $N $successeur&
    successeur=$!
done

exec sh maillon.sh $1 $successeur
