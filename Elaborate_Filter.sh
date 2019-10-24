#!/bin/bash

# Caso não existam arquvos para apagar, o erro é direcionado para /dev/null
rm filters/filter*.txt 2> /dev/null

# Filtra todas as rotas para o arquivo filter_All.txt de acordo com as lanes  com ponto de parada,  definidas no arquivo lanes.txt.
while read line
do
calc=$(cat erlangen.rou.xml | grep $line | wc -l)
echo "    #################### $calc veiculos utilizam a lane $line em sua rota #################" >> filters/filter_All.txt
echo "" >> filters/filter_All.txt
cat erlangen.rou.xml | grep -A 1 -B 1 $line | grep -v "-" >> filters/filter_All.txt
echo "" >> filters/filter_All.txt
done < filters/lanes.txt


# Filtra as 30 primeiras rotas que possuem uma lane com ponto de parada de acordo com o arquivo lanes.txt, para um arquivo filter_nomelane.txt
while read line2
do
echo "    #################### 30 Rotas de veículos que possuem a lane $line2 #################" > filters/filter_"$line2".txt
echo "" >> filters/filter_"$line2".txt
cat erlangen.rou.xml | grep -A 1 -B 1 $line2 | grep -v "-" | head -n 90  >> filters/filter_"$line2".txt
done < filters/lanes.txt


# Obs:

# * Alguns veiculos passam por lanes que nao possuem pontos de estacionamento, por isso nao sao filtrados;

# * Ao filtrar rotas utilizando arestas (lanes) como parametro de filtro, uma rota pode ser filtrada
# mais de uma vez, ja que uma rota possui mais de uma lane.

# Embora as rotas repitam, cada lane presente nelas possui 30 vagas de estacionamento.
