#!/bin/bash
for i in "$@" 
do
  if [ -f $i ]
  then
    more $i
  else
    echo "$i no es un fichero"
  fi
done