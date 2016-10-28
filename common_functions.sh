#!/bin/bash

#Grupo: 2ºBH
#Integrantes del grupo: Mauro Caitan, Federico Castro, Juan Reyes

# obtiene total meses de deuda para un apto
function meses_deuda() 
{
  cat pagos.txt |grep "A${PAGO_APT}"| tr " " "\n" |grep  -w --count "0"
}

# verifica si un apartamento tiene mas de 4 meses de deuda
# esto hay que arreglarlo está mal
function es_deudor () 
{
  MESES_DEUDA=$(cat pagos.txt |grep A* | tr " " "\n" |grep  -w --count "0")
  if [[ "${MESES_DEUDA}" -ge 4 ]]
  then 
      echo -ne  "\e[1;32mEl apartamento $PAGO_APT debe $MESES_DEUDA meses\e[0m" >> deudor"$PAGO_APT".txt
      if [ deudor"PAGO_APT.txt" ]
      then
          mv deudor"$PAGO_APT".txt /Deudores
      fi
  fi
}