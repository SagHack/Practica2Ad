#!/bin/bash
#818058, Arcega Vela, Hector, [T], [2], [A]
#821038, Alonso Gutierrez, Simon, [T], [2], [A]

if [ $# != 1 ]
then
    echo "Sintaxis: practica2_3.sh <nombre_archivo>"
elif [ -f $1 ]
then
    chmod u+x,g+x $1
    stat -c %A $1
else
    echo "$1 no existe"
fi
