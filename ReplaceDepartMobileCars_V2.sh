#!/bin/bash

## Obs: Gerar um arquivo "CarrosEmMovimento.xml".

## Se existirem arquivos gerados anteriormente eles são apagados
rm  *.txt 2> /dev/null

## Gera novas linhas para a substituição

j=115
zeros=".00"

for i in $(seq 600 3599);
do
  fltJ=$j$zeros
  echo "    <vehicle id=\"$i\" depart=\"$fltJ\">" >> linha1.txt
  let j=j+5
done

cat CarrosEmMovimento.xml | grep "<route edges" > linha2.txt
cat CarrosEmMovimento.xml | grep "</vehicle>" > linha3.txt

## Armazena o resultado da concatenação de linhas na tela e grava no arquivo
awk '{print;getline < "linha2.txt";print $0; getline < "linha3.txt";print $0}' < linha1.txt | tee Resultado.txt
