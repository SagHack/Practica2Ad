#!/bin/bash
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