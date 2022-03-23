#!/bin/bash
#818058, Arcega, Hector, T, 2, A
#821038, Alonso, Simon, T, 2, A



#Guardo el directorio actual
directorioOrigen=$(pwd)
#Voy al directorio raiz
cd
directorioHome=$(pwd)
#Buscamos la cantidad de directorios que sigan el patron
NdirDest=$(find bin??? -type d 2> /dev/null | wc -l)
#Comprobamos si hay algún directorio temporal ya creado
if [ "$NdirDest" -eq 0 ]
then
    #Creamos el archivo binXXX y nos quedamos con su nombre para crear el directorio
    nombreDirectorio=$(mktemp binXXX)
    rm -f $nombreDirectorio
    mkdir $nombreDirectorio
    $nombreDirectorio="$directorioHome/$nombreDirectorio"
    echo "Se ha creado el directorio $nombreDirectorio"
else
    dirDest=$(find bin??? -type d)
    #Seleccionar a que directorio muevo los archivos (al más antiguo)
    contador=0
    masAntiguo=0
    for i in "$dirDest"
    do
        t=$(stat -c %n,%Y $i)
        a=($(echo $t | tr ',' "\n"))
        if [ "$contador" -eq 0 ]
        then
            contador=1
            nombreDirectorio="$directorioHome/$i"
            masAntiguo=${a[1]}
        elif [ "${a[1]}" -lt "$masAntiguo" ]
        then
            masAntiguo=${a[1]}
            nombreDirectorio="$directorioHome/$i"
        fi   
    done
fi
echo "Directorio destino de copia: $nombreDirectorio"
#Vamos al direcotio origen
cd $directorioOrigen
contador=0
for i in $(ls)
do
	if [ -x "$i" -a -f "$i" ]
  then
	echo "./$i ha sido copiado a $nombreDirectorio"
  	cp $i $nombreDirectorio
    contador=$((contador+1))
  fi
done
if [ "$contador" -eq 0 ]
then
    echo "No se ha copiado ningun archivo"
else
    echo "Se han copiado $contador archivos"
fi
