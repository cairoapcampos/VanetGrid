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

`randomTrips.py -n name.net.xml -e 5000 -r name.rou.xml`

* Opções:

-n: Define o arquivo de rede de entrada;

-e: Deine o tempo final de simulação em segundos;

-r: Define o arquivo de saida de rota.

### Criar arquivo *.cfg

1. Criar um novo arquivo:

`nano name.sumo.cfg`

2. Adicionar o conteúdo abaixo:

```
<configuration>
               <input>
               <net-file value="name.net.xml"/>
               <route-files value="name.rou.xml"/>
               </input>
</configuration>
```

