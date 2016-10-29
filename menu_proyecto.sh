#!/bin/bash 
 
#Grupo: 2ºBH
#Integrantes del grupo: Mauro Caitan, Federico Castro, Juan Reyes

source common_functions.sh

#aviso
clear
while [ "$var" != 4 ]
do
        echo -e "\e[1;36m  B)bbbb   ##                                          ##      d)         
  B)   bb                                                      d)         
  B)bbbb   i) e)EEEEE n)NNNN  v)    VV e)EEEEE n)NNNN  i)  d)DDDD  o)OOO  
  B)   bb  i) e)EEEE  n)   NN  v)  VV  e)EEEE  n)   NN i) d)   DD o)   OO 
  B)    bb i) e)      n)   NN   v)VV   e)      n)   NN i) d)   DD o)   OO 
  B)bbbbb  i)  e)EEEE n)   NN    v)     e)EEEE n)   NN i)  d)DDDD  o)OOO  \e[0m  

        		\e[1;37;44m ¿Qué desea relizar?\e[0m
                \e[1;32m1) Ingresar o verificar pago
                2) Emitir estado de cuenta de propietarios\e[0m
                \e[1;31m3) Salir\e[0m
                \e[1;33m Ingrese opción: \e[0m"
        read var
case $var in
1) chmod u+x metodo_pago.sh; ./metodo_pago.sh;;
2) chmod u+x estado.sh; ./estado.sh;;
3) echo -e '\e[1;36m Saliendo...\e[0m' ; sleep 2; clear; exit;;
*) echo -e '\e[1;41m Opción incorrecta\e[0m' ; sleep 2; clear;
esac
done