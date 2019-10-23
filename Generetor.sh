#!/bin/bash

clear

rm erlangen.net.xml erlangen.rou.xml

echo
echo "Gerando o arquivo erlangen.net.xml com o grid: "
sleep 3
echo
netgenerate --g --number=4 --length=200 --o erlangen.net.xml
echo
echo "Gerando o arquivo erlangen.rou.xml que possui o fluxo de veiculos: "
sleep 3
echo
$HOME/src/sumo/tools/randomTrips.py -n erlangen.net.xml -e 3600 -r erlangen.rou.xml
echo
