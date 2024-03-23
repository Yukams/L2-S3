#! /bin/sh

text=""
for words in `cat f_anglais.txt`
do
	tmp=`grep "^$words" dico.txt | cut -f2 -d " "`
	text="$text $tmp"
done
echo $text > f_français.txt
