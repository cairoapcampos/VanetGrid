#!/bin/bash

# Caso não existam arquvos para apagar, o erro é direcionado para /dev/null
rm filters/filter*.txt 2> /dev/null

# Filtra as 30 primeiras rotas que possuem uma lane com ponto de parada de acordo com o arquivo lanes.txt, para um arquivo filter_nomelane.txt
while read line
do
cat erlangen.rou.xml | grep $line | sort | uniq -u | head -n 30  >> filters/filter_"$line".txt
done < filters/lanes.txt

ls filters | grep filter > filters/files.txt

while read line2
do

if [ $line2 = "filter_A1B1.txt" ]
then

   while read line3
   do
   newline3=$(echo "$line3" | sed 's/\//\\\//g')
   sed -i "/$newline3/a <stop parkingArea="parkingArea10" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_A1B1.txt

elif [ $line2 = "filter_A2B2.txt" ]
then

   while read line4
   do
   newline4=$(echo "$line4" | sed 's/\//\\\//g')
   sed -i "/$newline4/a <stop parkingArea="parkingArea4" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_A2B2.txt

elif [ $line2 = "filter_B1A1.txt" ]
then

   while read line5
   do
   newline5=$(echo "$line5" | sed 's/\//\\\//g')
   sed -i "/$newline5/a <stop parkingArea="parkingArea7" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_B1A1.txt

elif [ $line2 = "filter_B1B0.txt" ]
then

   while read line6
   do
   newline6=$(echo "$line6" | sed 's/\//\\\//g')
   sed -i "/$newline6/a <stop parkingArea="parkingArea15" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_B1B0.txt

elif [ $line2 = "filter_B1C1.txt" ]
then

   while read line7
   do
   newline7=$(echo "$line7" | sed 's/\//\\\//g')
   sed -i "/$newline7/a <stop parkingArea="parkingArea11" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_B1C1.txt

elif [ $line2 = "filter_B2A2.txt" ]
then

   while read line8
   do
   newline8=$(echo "$line8" | sed 's/\//\\\//g')
   sed -i "/$newline8/a <stop parkingArea="parkingArea1" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_B2A2.txt

elif [ $line2 = "filter_B2B1.txt" ]
then

   while read line9
   do
   newline9=$(echo "$line9" | sed 's/\//\\\//g')
   sed -i "/$newline9/a <stop parkingArea="parkingArea14" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_B2B1.txt

elif [ $line2 = "filter_B2C2.txt" ]
then

   while read line10
   do
   newline10=$(echo "$line10" | sed 's/\//\\\//g')
   sed -i "/$newline10/a <stop parkingArea="parkingArea5" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_B2C2.txt

elif [ $line2 = "filter_B3B2.txt" ]
then

   while read line11
   do
   newline11=$(echo "$line11" | sed 's/\//\\\//g')
   sed -i "/$newline11/a <stop parkingArea="parkingArea13" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_B3B2.txt

elif [ $line2 = "filter_C0C1.txt" ]
then

   while read line12
   do
   newline12=$(echo "$line12" | sed 's/\//\\\//g')
   sed -i "/$newline12/a <stop parkingArea="parkingArea18" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_C0C1.txt

elif [ $line2 = "filter_C1B1.txt" ]
then

   while read line13
   do
   newline13=$(echo "$line13" | sed 's/\//\\\//g')
   sed -i "/$newline13/a <stop parkingArea="parkingArea8" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_C1B1.txt

elif [ $line2 = "filter_C1C2.txt" ]
then

   while read line14
   do
   newline14=$(echo "$line14" | sed 's/\//\\\//g')
   sed -i "/$newline14/a <stop parkingArea="parkingArea17" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_C1C2.txt

elif [ $line2 = "filter_C1D1.txt" ]
then

   while read line15
   do
   newline15=$(echo "$line15" | sed 's/\//\\\//g')
   sed -i "/$newline15/a <stop parkingArea="parkingArea12" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_C1D1.txt

elif [ $line2 = "filter_C2B2.txt" ]
then

   while read line16
   do
   newline16=$(echo "$line16" | sed 's/\//\\\//g')
   sed -i "/$newline16/a <stop parkingArea="parkingArea2" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_C2B2.txt

elif [ $line2 = "filter_C2C3.txt" ]
then

   while read line17
   do
   newline17=$(echo "$line17" | sed 's/\//\\\//g')
   sed -i "/$newline17/a <stop parkingArea="parkingArea16" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_C2C3.txt

elif [ $line2 = "filter_C2D2.txt" ]
then

   while read line18
   do
   newline18=$(echo "$line18" | sed 's/\//\\\//g')
   sed -i "/$newline18/a <stop parkingArea="parkingArea6" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_C2D2.txt

elif [ $line2 = "filter_D1C1.txt" ]
then

   while read line19
   do
   newline19=$(echo "$line19" | sed 's/\//\\\//g')
   sed -i "/$newline19/a <stop parkingArea="parkingArea9" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_D1C1.txt

elif [ $line2 = "filter_D2C2.txt" ]
then

   while read line20
   do
   newline20=$(echo "$line20" | sed 's/\//\\\//g')
   sed -i "/$newline20/a <stop parkingArea="parkingArea3" duration="3000.00"\/>" erlangen.rou.xml
   done < filters/filter_D2C2.txt

else
   echo "Não há uma condição de comparação satifastória. Por favor revise o script!"
fi

done < filters/files.txt

# Obs:

# * Alguns veiculos passam por lanes que nao possuem pontos de estacionamento, por isso nao sao filtrados;

# * Ao filtrar rotas utilizando arestas (lanes) como parametro de filtro, uma rota pode ser filtrada
# mais de uma vez, ja que uma rota possui mais de uma lane.

# * Se uma rota é filtrada  mais de uma vez, no momento de inserir uma rota altomaticamente no arquivo *.rou.xml usando
# este script, mais de uma rota pode ser inserida como trajetória para o veiculo.

# Embora as rotas repitam, cada lane presente nelas possui 30 vagas de estacionamento.
