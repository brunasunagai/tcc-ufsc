# Dec 29th
fme = interpola os bloquinhos em volta e deopis faz a busca 
tem que gerar todos os blocos intermediarios 


MC = ja sabe qual bloco quer gerar entao nao precisa ficar gerando todos 
X e Y int: nao precisa interpolar nada 
X ou Y fracionarias: uma parte é inteira e a outra só que é frac, então nao precisa ter duas passadas 
X e Y frac: 
ver o vetor de entrada e decidir se tem que interpolar em uma ou duas passadas, ou se passa o bloco inteiro direto (vetor inteiro para x e y) 
eu recebo 2 ou 3 vetores 


como entrada geral: linha do bloco inteira, 
não esquecer do padding 

interpolação só precisa de um vetor fme (1 vet) ou um vet affine (2 vets) + uma linha 

o controle tem que decidir se vai se affine ou fme. e em cada um desses casos, tem que verificar se é em uma, duas ou nenhuma passada. 

para decidir se é affine ou fme, deve vir um sinal de controle externo que diria isso 

POWER POINT: 
vetorZ = para affine de 3 ptos 
mux tem seletor de 2 modos: fme ou gerador de vetores affine 
gerador de vet: precisa de seletor para 2 ou 3 pontos 

verificação com python e com metodo de testbench, pode ser igual da chipus
affine é sempre 4x4 mas poderiamos pensar em duas linhas em paralelo 
lembrar que é com pipeline 

15 de março: artigo 
1 de março: arquitetura pronta