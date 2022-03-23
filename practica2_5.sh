#!/bin/bash
#818058, Arcega, Hector, T, 2, A
#821038, Alonso, Simon, T, 2, A

nfich=0
ndir=0
echo -n "Introduzca el nombre de un directorio: "
read directorio
if [ -d "$directorio" ]
then
  #cd "$directorio"
  nfich=$(find "$directorio" -type f 2> /dev/null | wc -l)
  #Este comando cuenta el numero de directorios incluyendo el directorio principal, por eso restamos 1 a ndir
  ndir=$(find "$directorio" -type d 2> /dev/null | wc -l)
  ndir=$((ndir-1))
  echo "El numero de ficheros y directorios en $directorio es de $nfich y $ndir, respectivamente"
else
  echo "$directorio no es un directorio"
fi
