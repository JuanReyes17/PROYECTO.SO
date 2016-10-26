#!/bin/bash 
clear
while [ "$var" != 4 ]
do
        echo -e "  \e[1;37;44m ¿Qué desea relizar?\e[0m
                \e[1;32m1) Ingresar o verificar pago
                2) Emitir estado de cuenta de propietarios
                3) Atrasos\e[0m
                \e[1;31m4) Salir\e[0m
                \e[1;33m Ingrese opción: \e[0m"
        read var
case $var in
1) ./metodo_pago.sh;;
2) ./estado.sh;;
3) ./atrasos.sh;;
4) echo -e '\e[1;36m Saliendo...\e[0m' ; sleep 2; clear;;
*) echo -e '\e[1;41m Opción incorrecta\e[0m' ; sleep 2; clear;
esac
done
