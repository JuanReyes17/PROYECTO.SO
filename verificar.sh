#!/bin/bash

#Grupo: 2ºBH
#Integrantes del grupo: Mauro Caitan, Federico Castro, Juan Reyes

clear
echo -e "\e[1;35m=================================================\e[0m"
echo -ne "\e[1;36m-> \e[0m"
cat pagos.txt
echo -e "\e[1;36mSe muestra 0 si ya pagó el mes y 2100 si no lo pagó\e[0m"
echo -e "\e[1;35m=================================================\e[0m"
read -p "Ingrese apartamento a verificar: " PAGO_APT
if grep -wq $PAGO_APT propietarios.txt 2> /dev/null
then
	read -p "Ingrese mes a verificar en formato numérico: " PAGO_MES
	if [ $PAGO_MES -lt 17 ]
    then
		PAGO_MES_POS=$(($PAGO_MES + 1)) # +1 por la columna con el id de apartamento
		while read APT_LINE
		do 
			APT=$(echo $APT_LINE |awk '{print $1}') # extraigo # de apto
			if [[ "A${PAGO_APT}" == "${APT}" ]]
			then
		       		 # si el apto actual en el while es el deseado...      
				APT_LINE_MES=$(echo $APT_LINE |cut -d " " -f $PAGO_MES_POS) # obtengo dato actual para el mes que se desea pagar
				if [[ "${APT_LINE_MES}" == "0" ]]
		       		then
			        	# si ya pago...
					echo -ne "\e[1;37;42mEl pago del mes ${PAGO_MES} para el apartamento ${PAGO_APT} fué realizado con éxito\e[0m"
					echo " "
					echo -e "\e[1;30mPresione ENTER para continuar.\e[0m"
		    		read op
				else
					# si no pago
			         	echo -ne "\e[1;37;42mNo se ah efectuado el pago del apartamento ${PAGO_APT} para el mes ${PAGO_MES}\e[0m"
						echo " "
						echo -e "\e[1;30mPresione ENTER para continuar.\e[0m"
		    			read op
				fi 	
				
			fi
		done <<< "$(cat pagos.txt |tail -n +2)";
	else
    	echo -e "\e[1;32mNúmero de mes incorrecto\e[0m"
    	read -p "Presione ENTER para continuar"
    	clear
    fi	
else
    echo -e "\e[1;32mNúmero de apartamento incorrecto\e[0m"
    read -p "Presione ENTER para continuar"
    clear
fi