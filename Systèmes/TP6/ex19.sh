#! /bin/sh

echo "Affichage détaillé des processus :\n"
ps -ef

echo "\n\nAffichage très détaillé des processus:\n"
ps -el

echo "\n\nNombre de process firefox :"
ps -e | grep -c "firefox"
