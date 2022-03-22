#!/bin/bash
#818058, Arcega Vela, Hector, [T], [2], [A]
#821038, Alonso Gutierrez, Simon, [T], [2], [A]

nfich=0
ndir=0
echo -n "Introduzca el nombre de un directorio: "
read directorio
if [ -d $directorio ]
then
  cd $directorio
  for i in $(ls)
  do 
      if [ -f $i ]
      then 
          nfich=$((nfich+1))
      elif [ -d $i ]
      then  
          ndir=$((ndir+1))
      fi
  done
  echo "El numero de ficheros y directorios en $directorio es de $nfich y $ndir, respectivamente"
else
  echo "$directorio no es un directorio"
fi
