#Grupo: 2ºBH
#Integrantes del grupo: Mauro Caitan, Federico Castro, Juan Reyes

#!/bin/bash
clear
echo -e "\e[1;35m=================================================\e[0m"
echo -ne "\e[1;36m-> \e[0m"
cat pagos.txt
echo -e "\e[1;36mSe muestra 0 si ya pagó el mes y 2100 si no lo pagó\e[0m"
echo -e "\e[1;35m=================================================\e[0m"
read -p "Ingrese núemero de apartamento que desea visualizar: " NUM_AP
if grep -wq $NUM_AP propietarios.txt 2> /dev/null
then
	echo "   1 2 3 4 5 6 7 8 9 10 11 12"
	TEMP=$(mktemp)
	grep -w A$NUM_AP pagos.txt >> $TEMP
	echo -n "Total deuda: " >> $TEMP
	cat $TEMP | tr " " "\n" |grep  -w "2100" | awk '{ sum += $1 } END { print sum }' >> $TEMP
	cat $TEMP
    read -p "Presione cualquier tecla para continuar"
	clear
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