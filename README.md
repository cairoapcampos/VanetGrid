# VanetGrid

## Instruções ![status](https://img.shields.io/readthedocs/pip.svg)

### Gera um grid do tipo Manhattan:

```
netgenerate --g --number=4 --length=200 --o name.net.xml
ou 
netgenerate --g --grid.number=4 --grid.length=200 --o name.net.xml
```

* Opções:

--g: Define que a rede a ser criada será do tipo grid

--o: Grava a rede gerada em um arquivo de saída

--number: Define o número de junções em ambas as direções. O comando acima criará um grid 4x4.

--length: Comprimento das ruas nas duas direções


### Gerar fluxo de veiculos aleatórios

`/home/user/src/sumo/tools/randomTrips.py -n name.net.xml -e 5000 -r name.rou.xml`

* Opções:

-n: Define o arquivo de rede de entrada;

-e: Deine o tempo final de simulação em segundos;

-r: Define o arquivo de saida de rota.

### Criar arquivo *.cfg

1. Criar um novo arquivo:

`nano name.sumo.cfg`

2. Adicionar o conteúdo abaixo:

```
<configuration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://sumo.dlr.de/xsd/sumoConfiguration.xsd">
      
	<input>
            <net-file value="name.net.xml"/>
            <route-files value="name.rou.xml"/>
        </input>

        <report>
             <xml-validation value="never"/>
             <xml-validation.net value="never"/>
             <no-step-log value="true"/>
        </report>

        <gui_only>
             <start value="true"/>
        </gui_only>

</configuration>
```

### Definir áreas de parada:

1. Inserir as linhas abaixo no final do arquivo `net.xml`:

```
<parkingArea id="parkingArea1" lane="B3B2_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea2" lane="B2B1_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea3" lane="B1B0_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>

<parkingArea id="parkingArea4" lane="C2C3_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea5" lane="C1C2_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea6" lane="C0C1_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>

<parkingArea id="parkingArea7" lane="B2A2_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea8" lane="C2B2_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea9" lane="D2C2_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>

<parkingArea id="parkingArea10" lane="A2B2_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea11" lane="B2C2_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea12" lane="C2D2_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>

<parkingArea id="parkingArea13" lane="B1A1_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea14" lane="C1B1_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea15" lane="D1C1_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>

<parkingArea id="parkingArea16" lane="A1B1_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea17" lane="B1C1_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
<parkingArea id="parkingArea18" lane="C1D1_0" roadsideCapacity="30" startPos="10.00" endPos="180.00"/>
```

* Opções:

id: Nome da área de estacionamento

lane: nome da faixa de transito definida pelo SUMO

roadsideCapacity: Capacidade de veiculos em cada área de estacionamento

startPos: posição inicial da faixa em metros

endPos: Posição final da faixa em metros

### Definir veículos que estacionarão

1. Como abaixo, para cada veículo que deverá estacionar inserir a linha:

`<stop parkingArea="parkingArea13" duration="3000.00"/>` entre as tags `<vehicle>` e `</vehicle>` no arquivo `rou.xml`:

```
<vehicle id="0" depart="0.00">
        <route edges="0/3to1/3 1/3to1/2 1/2to0/2 0/2to0/3"/>
        <stop parkingArea="parkingArea13" duration="3000.00"/>
 </vehicle>
 ```
 
* Opções:

#### Tag vehicle

depart: Tempo em que o veículo deve entrar na rede

id: ID do veículo

#### Tag route

edges: Define o nome das vias (arestas) pelas quais um veiculo passará (rota de um veículo). A área de estacionamento deve estar em uma destas arestas.

#### Tag stop:

parkingArea: Nome da área de estacionamento

duration: Tempo de parada

### Rodar simulação no SUMO graficamente:

1. Executar o comando:

`sumo-gui name.sumo.cfg`

Exemplo de Grid 4x4 com pontos de parada ao executar o comando acima:

![Grid 4x4 com paradas](https://github.com/cairoapcampos/VanetGrid/raw/master/Grid4x4.png)

### Informações Gerais:

1. Diretório de ferramentas do SUMO:

`/home/veins/src/sumo/tools`

2. Listar parametros de randomTrips e netgenerate:

`./randomTrips.py --help ou ./randomTrips.py -h`

`netgenerate --help`


### Fontes:

* http://alibalador.blogspot.com/2013/02/working-with-sumo.html
* https://sumo.dlr.de/docs/NETGENERATE.html
* https://sumo.dlr.de/docs/Tools/Trip.html
* https://sumo.dlr.de/docs/Tutorials/Manhattan.html
* http://manpages.ubuntu.com/manpages/cosmic/man1/netgenerate.1.html
* https://sumo.dlr.de/docs/Simulation/ParkingArea.html
* https://sumo.dlr.de/docs/Definition_of_Vehicles,_Vehicle_Types,_and_Routes.html
