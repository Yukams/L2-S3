#! /bin/sh
trap "return 0" SIGCONT

attendreJeton() {
    while true
    do
        sleep 1
    done
}

donnerJetonAuSuivant() {
    kill -n 19 $1
}

if [ $# -eq 2 ]
then
    expr $1 + 0 >/dev/null 2>&1
    if [ $? -gt 0 ]
    then
        echo "Usage : M ($1) should be a number" >&2
        exit 2
    else
        expr $2 + 0 >/dev/null 2>&1
        if [ $? -gt 0 ]
        then
            echo "Usage : PID_SUIVANT ($2) should be a number" >&2
            exit 3
        fi
    fi
else
    echo "Usage : $0 M PID_SUIVANT" >&2
    exit 1
fi

if [ $1 -eq 1 ]
then
    echo "\nMaillon $1/$$ ayant pour successeur $2 a le jeton"
    echo "Maillon $1/$$ ayant pour successeur $2 donne le jeton"
    kill -s CONT $2
fi

while true
do
    attendreJeton
    echo "\nMaillon $1/$$ ayant pour successeur $2 a le jeton"
    echo "Maillon $1/$$ ayant pour successeur $2 donne le jeton"
    donnerJetonAuSuivant $2
done
