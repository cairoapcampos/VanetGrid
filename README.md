# VanetGrid

## Instruções ![status](https://img.shields.io/readthedocs/pip.svg)

### Gera um grid do tipo Manhattan:

`netgenerate --g --number=4 --length=200 --o name.net.xml`
ou 
`netgenerate --g --grid.number=4 --grid.length=200 --o name.net.xml`

Obs:
--g: Define que a rede a ser criada será do tipo grid
--o: Grava a rede gerada em um arquivo de saída
--number: Define o número de junções em ambas as direções.
Acima criará um grid 4x4.
--length: Comprimento das ruas nas duas direções
