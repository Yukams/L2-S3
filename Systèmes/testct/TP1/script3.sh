#! /bin/sh

mkdir REP
ls > REP/liste.txt
cp `cat REP/liste.txt | tail -1` REP
rm REP/liste.txt
