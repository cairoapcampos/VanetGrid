#!/bin/bash

# Filtra as rotas que possuem as lanes definidas no arquivo lanes.txt
while read line
do
cat erlangen.rou.xml | grep $line >> filter.txt
done < lanes.txt

# Ordena as linhas das rotas no arquivo e depois remove as linhas repetidas
cat filter.txt | sort | uniq -u > filter2.txt

# Obs:

# * Alguns veiculos passam por lanes que nao possuem pontos de estacionamento, por isso nao sao filtrados;

# * Ao filtrar rotas utilizando arestas (lanes) como parametro de filtro, uma rota pode ser filtrada
# mais de uma vez, ja que uma rota possui mais de uma lane.

# Embora as rotas repitam, cada lane presente nelas possui 30 vagas de estacionamento.
