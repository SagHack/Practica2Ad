#!/bin/bash
#818058, Arcega, Hector, T, 2, A
#821038, Alonso, Simon, T, 2, A

for i in "$@"
do
  if [ -f "$i" ]
  then
    more "$i"
  else
    echo "$i no es un fichero"
  fi
done
