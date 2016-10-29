#!/bin/bash

#Grupo: 2ºBH
#Integrantes del grupo: Mauro Caitan, Federico Castro, Juan Reyes

function aviso ()
{
  clear

for (( i=1; i<=17; i++ ))
do
cat -n pagos.txt | grep -w $i | grep -o 2100 | wc -l >> aux
done
deudores=`grep [4-9] aux | wc -l`
if [ $deudores -gt 3 ]
then
    echo -e "\e[1;35mExisten $deudores apartamentos con atrasos de 4 meses o mas en el pagos de gastos comunes\e[0m"
    echo -e "\e[1;36mPresione ENTER para continuar\e[0m"
    read op
    clear
fi
rm aux
}