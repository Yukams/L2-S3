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
	echo "C'est le tour du père de PID : $1"
	sleep 1
	echo "Le pere de pid $1 donne le tour au fils de $$"
	kill -CONT $1
	echo "Le père de PID : $1 attend son tour"
}

./fils.sh $$ &
sleep 1
while true
do
	donnerTour $!
	attendreTour
done
