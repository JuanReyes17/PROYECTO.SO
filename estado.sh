#!/bin/bash
clear
cat pagos.txt
echo "================================================="
read -p "Ingrese núemero de apartamento que desea visualizar: " NUM_AP
if grep -wq $NUM_AP propietarios.txt 2> /dev/null
then
	echo "   1 2 3 4 5 6 7 8 9 10 11 12"
	TEMP=$(mktemp)
	grep -w A$NUM_AP pagos.txt >> $TEMP
	echo -n "Total deuda: " >> $TEMP
	cat $TEMP | tr " " "\n" |grep  -w "2100" | awk '{ sum += $1 } END { print sum }' >> $TEMP
	cat $TEMP
	sleep 2
	echo -e "\e[1;33msaliendo...\e[0m"; sleep 2; clear
    else
    echo -n "Número de apartamento incorrecto, para ingresar uno nuevo presione cualquier tecla, para salir s: "
    read op
    if [ $op = s ]
    then
    	echo -e "\e[1;33msaliendo...\e[0m"
    	sleep 2
    	clear
    fi
fi