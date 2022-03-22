#!/bin/bash
#818058, Arcega Vela, Hector, [T], [2], [A]
#821038, Alonso Gutierrez, Simon, [T], [2], [A]

#Guardo el directorio actual
directorioOrigen=$(pwd)
#Voy al directorio raiz
cd
directorioHome=$(pwd)
#Creo el fichero con el nombre binXXX
nombreDirectorio=$(mktemp binXXX)
rm -f $nombreDirectorio
mkdir $nombreDirectorio
echo "Se ha creado el directorio $nombreDirectorio"
dirTemporales=$(find bin??? -type d)
#Seleccionar a que directorio muevo los archivos
contador=0
masAntiguo=0
nomAntiguo="$directorioHome/$nombreDirectorio"
for i in $dirTemporales
do
    t=$(stat -c %n,%Y $i)
    a=($(echo $t | tr ',' "\n"))
    if [ $contador -eq 0 ]
    then
      contador=1
      nomAntiguo="$directorioHome/$i"
      masAntiguo=${a[1]}
    elif [ ${a[1]} -lt $masAntiguo ]
    then
      masAntiguo=${a[1]}
      nomAntiguo="$directorioHome/$i"
    fi   
done
echo "Directorio destino de copia:$nomAntiguo"
#Vamos al direcotio origen
cd $directorioOrigen
contador=0
for i in $(ls)
do
	if [ -x $i -a -f $i ]
  then
	echo "$i ha sido copiado a $nomAntiguo"
  	cp $i $nomAntiguo
    contador=$((contador+1))
  fi
done
echo "Se han copiado $contador archivos"


