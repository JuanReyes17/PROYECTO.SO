#!/bin/bash

#Grupo: 2ºBH
#Integrantes del grupo: Mauro Caitan, Federico Castro, Juan Reyes

#function deudor()
#
#  cat pagos.txt | grep -w A2 | tr " " "\n" |grep  -w "2100" | awk '{ sum += $1 } END { print sum }'

#}

function aviso()
{
  for (( i=1; i<=17; i++ ))
  do
    cat pagos.txt | grep -w $i | tr " " "\n" |grep  -w "2100" | awk '{ sum += $1 } END { print sum }' >> aux
    deudor=`cat aux`
    if [ $deudor -gt 8399 ]
    then
        echo "El apartamento x debe $deudor"
        read op    
    fi
    rm -r aux
  done
}