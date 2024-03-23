#! /bin/sh

trap "return 0" SIGCONT

attendreTour() 
{
	while true
	do
		sleep 1
	done
}

donnerTour()
{
	echo "C'est le tour du fils de $1"
	sleep 1
	echo "Le fils de PID : $1 donne le tour au père de $$"
	kill -n 19 $1
	echo "Le fils de PID : $1 attend son tour"
}

while true
do
	attendreTour
	donnerTour $1
done
