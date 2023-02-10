# Interpolation notes
- > **Interpolation representation: [Link to Google Sheets](https://docs.google.com/spreadsheets/d/1AQiJA64BiLvZiIIWtz4v4J0p_Ya3iRX3FwPq1uFpbFI/edit#gid=1674681217)**
  - **<span style="color:blue">Considerações na minha implementação:</span>**
    ![Alt text](images/interpolation_direction.png)
    - **Precisão de 1/16**: eu achei que tinha lido que a precisão era de 1/4, mas não é isso porque no VTM tem 15 filtros disponíveis para Affine.
    Obs: 1/4 de precisão é para a FME! 
    - **Direção de geração de amostras fracionárias**, a partir de amostras inteiras, é para baixo e para esquerda.
    Logo, as amostras no limite direito NÃO geram amostras fracionárias horizontais. 
    E as amostras no limite inferior, NÃO geram amostras fracionárias verticais.
    - **Input**: uma linha de tamanho N + 2*PADDING:
    ![Alt text](images/input_line_interpolation.png)
    - **Processamento paralelo de uma linha/coluna** do bloco por vez: precisaria de *N-1 sets de filtros*. 
      [?] Na minha arquitetura do SIM, fizemos N+1 sets paralelos...
      Por exemplo, N=4 precisa gerar as amostras fracionárias entre os 4 inteiros, ou seja, são 3x4 amostras geradas: ![Alt text](images/process_a_line.png)
    - **Número de ciclos** necessários para completar o processamento de um bloco NxN: 
     $$
      ciclos=C_H + C_V + C_D = N + N + (N-1)\times(FRAC-1)\\
      N=4,FRAC=4\rightarrow ciclos=17
     $$
    - **Cada amostra tem 8 bits** em complemento de 2
---

- <span style="color:black"> VVC define filtros de interpolação de **8-taps**, que utilizam **até** 8 amostras de posições inteiras ao redor da amostra gerada: ? </span>
- O VVC define que os **Motion Vectors (MVs)** tenham precisão de até 1/4, então por exemplo entre os inteiros 1 e 2, temos: 1, 1.25, 1.50, 1.75 e 2. Logo, são necessários **3 filtros** diferentes de interpolação para gerar essas 3 amostras fracionárias. 
- O bloco de pixels originais é na verdade o bloco resultante da **Integer Motion Estimation (IME)** e é a partir dos blocos resultantes dessa etapa que devem ser gerados os blocos fracionários. 

    **Figura 9.** Abaixo podemos ver em azul, o bloco inteiro resultante da IME e em volta temos 48 outros blocos fracionários gerados. Essas 48 amostras são a quantidade total de blocos fracionários que podem ser gerados. 
    No caso de ser uma Motion Compensation (MC) não necessariamente se deve gerar todos esses blocos, mas apenas aqueles necessários indicados pelo MV. 
    **Em 9a)** há um exemplo do algoritmo empregado pelo VTM que avalia apenas os 16 blocos de 1/2 precisão ao invés de comparar todos os 48 blocos de uma vez com a CB atual. Então, depois de encontrar o melhor bloco candidato (que pode ser um inteiro também), que no exmplo foi o 40, o algoritmo gera os outros blocos de precisão 1/4 em volta do 40 (em amarelo) e estes são comparados com a CB.
    ![Alt text](./images/fig9_interp.jpg)

    **Figura 10.** Abaixo, em 10a) os 8 blocos inteiros horizontais, em amarelo são necessários para a geração dos 3 blocos fracionários em verde. Já em 10b) , está representado o mesmo processo porém para geração de 3 amostras fracionárias verticais, em vermelho, a partir dos 8 blocos inteiros, em amarelo.
    ![Alt text](./images/fig10_interp.jpg)

- > "**As amostras interpoladas são então agrupadas para gerar os blocos candidatos em posições fracionárias**, e esses blocos candidatos avaliados quanto a sua similaridade com a coding block atual pelo passo de busca e comparação. No total, até 48 novos blocos em posições fracionárias podem ser gerados ao redor do resultado da IME. **A Figura 9a) representa o agrupamento das amostras em posições fracionárias**, na qual cada um dos quadrados de 1 a 48 representam a primeira amostra de cada um dos 48 blocos fracionários que podem ser gerados" (p. 26, Exame de qualificação Murilo).
- From the PCS article:
    > "VVC simplifies this model by using **pixel blocks** instead of individual pixels, resulting in lower memory usage and complexity. Each macroblock consists of many 4x4 pixel sub-blocks. Each ub-block has its own macro-block-derived motion vector estimate (MV), which in VVC can range from a single sub-block (4x4 pixels) to a 128x128 block (1024 sub-blocks) [3]"

- Equaões dos filtros: 
  $$
    A_{-3}C_0+A_{-2}C_1+A_{-1}C_2+A_0C_3+A_1C_4+A_2C_5+A_3C6+A_4C_7
  $$
  A
  A


