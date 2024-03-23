#! /bin/sh

choice="null"
until [ "$choice" = "fin" ]
do
    echo "\n\nVous pouvez taper une commande Unix, ou bien :\nfin si vous souhaitez quitter l’application\nrelancer n si vous souhaitez relancer les n dernières commandes\n\nVotre choix :\t"
    read choice
    
    if [ "$choice" = "fin" ]
        then
        rm temp.txt
        exit 0
    fi
    
    if [ `echo "$choice" | grep -c "relancer [0-9]*"` -gt 0 ]
        then
        choice=`echo "$choice" | cut -f2 -d ' '`
    
        expr $choice + 0 >/dev/null 2>&1
        if [ ! $? -gt 0  ]
            then
            if [ -f temp.txt -a -r temp.txt ]
                then
                grep '^$ .*' temp.txt > newTmp.txt
                tail -r newTmp.txt | tail -n +$(expr $choice + 1) | tail -r > start.txt
                
                tail -$(expr $choice) newTmp.txt | cat | while read ligne
                do
                    echo "$ligne" >> start.txt
                    eval `echo $ligne | cut -f2- -d ' '` | tee >> start.txt
                done
                rm newTmp.txt
                cp start.txt temp.txt
                rm start.txt
                
            else
                echo "\nErreur, temp.txt est vide ou non accessible en lecture\n"
                exit 2
            fi
        else
            echo "\nErreur, utilisez : relancer <nombre>\n"
            exit 1
        fi
        
    else
        echo "\$ $choice" >> temp.txt
        eval $choice
    fi
done
