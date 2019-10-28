cat erlangen.rou.xml | grep depart | awk '{print $3}' | cut -d'"' -f2 > timeCar.txt

max=719

while read line
do

lineInt=${line%.*} #Converte float para um int

if [ $lineInt -le $max ]
then
    sed -i "s/depart=\"$line\"/depart=\"0.00\"/" erlangen.rou.xml
    echo "depart=\"$line\" alterado para depart=\"0.00\""
fi

done < timeCar.txt
