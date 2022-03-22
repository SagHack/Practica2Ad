#!/bin/bash
#818058, Arcega Vela, Hector, [T], [2], [A]
#821038, Alonso Gutierrez, Simon, [T], [2], [A]

OLDIFS=$IFS #Guardo el IFS en una variable para luego poder recuperarlo
IFS='' #Si cambio el IFS a nulo, al hacer read no me ignora los espacios del principio
echo -n "Introduzca una tecla: "
read char
char=${char:0:1} #Cojo el primer caracter de la variable 

if [[ $char = [[:alpha:]] ]]
then 
    echo "$char es una letra"
elif [[ $char = [[:digit:]] ]]
then 
    echo "$char es un numero"
else
    echo "$char es un caracter especial"
fi
IFS=$OLDIFS #restauro el IFS
