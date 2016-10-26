#!/bin/bash
clear
while [ "$var" != 3 ]
do
	echo -e "
		\e[1;32m1) Al contado
		2) Verificar pago a través de la banca electrónica\e[0m
		\e[1;35m3) Volver\e[0m
		\e[1;33m Ingrese opción: \e[0m"
	read var
	case $var in
		1) ./pagar.sh;;
		2) ./verificar.sh;;
		3) echo -e '\e[1;32m Regresando...\e[0m'; sleep 2 ; clear;;
		*) echo -e '\e[1;41m Opción incorrecta\e[0m'; sleep 2; clear 
	esac
done
