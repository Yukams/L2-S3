#! /bin/sh

choice="0"
while [ ! $choice -eq -2 ]
do
	list=`ls -l | grep "^d" | tr -s "\t" " " | cut -f9 -d " " | cat -n`
	ls -l | grep "^d" | tr -s "\t" " " | cut -f9 -d " " | cat -n
	pwd
	read choice
	
	expr $choice + 0 >/dev/null 2>/dev/null
	if [ $? -eq 2 ]
	then
		echo "ONLY USE NUMBERS"
		exit 1
	fi
	
	if [ $choice -eq -1 ]
	then
		cd ..
	fi
	
	test=`echo $list | grep -c "^$choice"`
	if [ $choice -gt 0  ]
	then
		if [ $test -eq 1 ]
		then
			cd ./`echo $list | grep "^$choice" | cut -f2 -d" "`
		else
			echo "THIS NUMBER IS NOT IN THE LIST, TRY AGAIN"
		fi
	fi
done
exit 0
