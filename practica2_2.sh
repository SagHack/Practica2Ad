#!/bin/bash
#818058, Arcega Vela, Hector, [T], [2], [A]
#821038, Alonso Gutierrez, Simon, [T], [2], [A]

for i in "$@" 
do
  if [ -f $i ]
  then
    more $i
  else
    echo "$i no es un fichero"
  fi
done
