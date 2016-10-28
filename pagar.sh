#Grupo: 2ºBH
#Integrantes del grupo: Mauro Caitan, Federico Castro, Juan Reyes

#!/bin/bash
source common_functions.sh

echo -e "\e[1;35m=================================================\e[0m"
echo -ne "\e[1;36m-> \e[0m"
cat pagos.txt 
echo " "
echo -e "\e[1;36mSe muestra 0 si ya pagó el mes y 2100 si no lo pagó\e[0m"
echo -e "\e[1;35m=================================================\e[0m"
dia=`date +%d`
	if [ $dia -le 10  ]
	then
		echo -ne "\e[1;33mSe a efectuado un 5% de descuento debido a que estamos antes del dia 10, monto a pagar es 1995\e[0m"
		echo
	else
		echo -ne "\e[1;33mMonto a pagar es 2100\e[0m"
		echo 
	fi
read -p "Ingrese número de apartamento: " PAGO_APT
if grep -wq $PAGO_APT propietarios.txt 2> /dev/null
then
	read -p "Ingrese mes a pagar en formato numérico: " PAGO_MES;
    PAGO_MES_POS=$(($PAGO_MES + 1)) # +1 por la columna con el id de apartamento
    TMP_FILE=$(mktemp); # obtengo nombre archivo temporal
    echo "1 2 3 4 5 6 7 8 9 10 11 12" >> $TMP_FILE # agregamos cabecera meses al archivo
    clear
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
          MSG="El mes ${PAGO_MES} para el apartamento ${PAGO_APT} ya esta pago, que tenga un buen día"
          echo $APT_LINE >> $TMP_FILE
        else
          # si no pago
          MSG="El pago del apartamento ${PAGO_APT} para el mes ${PAGO_MES} fue realizado con exito, que tenga un buen día";
          IZQ=$(echo $APT_LINE |cut -d " " -f 1-$(( ${PAGO_MES_POS} - 1 ))) # cortamos la izquierda del mes a pagar
          DER=$(echo $APT_LINE |cut -d " " -f $(( ${PAGO_MES_POS} + 1 ))-)
          echo "$IZQ 0 $DER" >> $TMP_FILE
        fi  
      else 
                 echo $APT_LINE >> $TMP_FILE
    fi
    done <<< "$(cat pagos.txt |tail -n +2)"
 
    mv pagos.txt pagos.txt.old.$(date +%s) && mv $TMP_FILE pagos.txt
    cat pagos.txt
    rm -r pagos.txt.old.$(date +%s)
    echo -e "\e[1;33;44m${MSG}\e[0m"
    echo " "
    echo -e "\e[1;30mPresione cualquier tecla para continuar.\e[0m"
    read op
    clear	
else
    echo -ne "\e[1;32mNúmero de apartamento incorrecto, para ingresar uno nuevo presione cualquier tecla, para salir s: \e[0m"
                read op
                if [ $op = s ]
                then
                        echo -e "\e[1;34msaliendo...\e[0m"
				fi
fi