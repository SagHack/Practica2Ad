#!/bin/bash
#818058, Arcega, Hector, T, 2, A
#821038, Alonso, Simon, T, 2, A

echo -n "Introduzca el nombre del fichero: "
read nfich
#Tener cuidado por que no lo hacemos para que funcione en todos los directorios
#comprobamos que el archivo existe
if [ -f "$nfich" ]
then
  #comprobamos el permiso de lectura
  if [ -r "$nfich" ]
  then
    imprimir="r"
  else
    imprimir="-"
  fi
  #comprobamos el permiso de escritura
  if [ -w "$nfich" ]
  then
    imprimir+="w"
  else
    imprimir+="-"
  fi
  #comprobamos el permiso de ejecucion
  if [ -x "$nfich" ]
  then
    imprimir+="x"
  else
    imprimir+="-"
  fi
  echo  "Los permisos del archivo $nfich son: $imprimir"
else 
	echo "$nfich no existe"
fi
