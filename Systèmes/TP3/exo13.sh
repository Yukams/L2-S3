#! /bin/sh

choice=1

until test $choice -eq -2
do
currentDir=`pwd`
echo "\n\nRépertoire actuel : $currentDir\n"

itemList=`ls -l | grep "^d" | tr -s "\t" ' ' | cut -f9- -d' ' | cat -n`

if test `echo "$itemList" | grep -c "1"` -ge 1
then 
	echo "Choisissez dans quel dossier naviguer :"
	echo "$itemList\n"
	read choice

	chosenDir=`echo "$itemList" | grep "^.* $choice\t" | cut -c 8-`
	

	echo "\nVous avez choisi le dossier $chosenDir\n"


	echo "Que souhaitez vous faire ? (-2 quitter le programme, -1 se déplacer, 0 rien faire) :"
	read choice
else	
	echo "\n\nIl n'y a plus d'autres dossiers\n"
	choice=-2
fi

if test $choice -eq 0
then
	echo "Vous ne vous êtes pas déplacé\n"
elif test $choice -eq -1
then
	echo "Vous vous déplacez dans le répertoire $chosenDir\n"
	cd $chosenDir
elif test $choice -eq -2
then
	echo "Fin du programme\n"
	break
else
	echo "Commande incorrecte... Recommencez\n"
fi

done


exit 0
