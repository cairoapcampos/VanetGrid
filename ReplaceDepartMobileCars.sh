#!/bin/bash

cat erlangen.rou.xml | grep depart | awk '{print $3}' | cut -d'"' -f2 > timeCar.txt

minDepart=121 # A partir deste valor minimo de depart o arquivo vai ser alterado.
cont=1
zeros=".00"

while read depart
do

departInt=${depart%.*} # Converte o valor de depart de float para int.

if [ $departInt -ge $minDepart ] # Compara se departInt é maior ou igual a minDepart.
then
     newDepart=$cont$zeros
     sed -i "s/depart=\"$depart\"/depart=\"$newDepart\"/" erlangen.rou.xml
     echo "depart=\"$depart\" alterado para depart=\"$newDepart\""
     let cont=cont+1
fi

done < timeCar.txt
