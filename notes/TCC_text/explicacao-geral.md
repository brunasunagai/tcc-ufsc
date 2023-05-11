# Arquitetura proposta: fluxo geral
> Adicionar figura do fluxo completo (label = fig:gen_view)
> (a) Um quadro de referência particionado. 
> (b) Um bloco de referência do quadro, dividido em sub-blocos de 4x4 pixels. 
> (c) Um sub-bloco do bloco de referência com seus 4x4 pixels visíveis. 
 
Para uma visão geral do funcionamento da arquitetura projetada, a Figura \ref{fig:general_view} representa o processo desde um quadro completo de vídeo até o bloco resultante da interpolação. Inicialmente, temos um quadro de vídeo que serve de referência durante a codificação. Este quadro é particionado em vários blocos menores que podem ter dimensões de 2x2 até 128x128 pixels dependendo da similaridade entre os pixels vizinhos \cite{?}, como mostrado no exemplo em Fig. \ref{fig:gen_view}(a). O bloco resultante das divisões, será utilizado como base e nele pode ser aplicada a transformação Affine, caso o algoritmo do \gls{VVC} detectar que houve algum movimento do tipo rotação, zoom em escala, etc. Portanto, considerando que este é o caso, o bloco passará pela transformação Affine e para isso ele deve ser novamente dividido em sub-blocos de dimensões 4x4 pixels, como na Fig. \ref{fig:gen_view}(b). Essa é uma técnica utilizada pelo \gls{VVC} para reduzir a complexidade de calcular a transformada para cada pixel individualmente, estimando então que todos os pixels do sub-bloco terão o mesmo comportamento.  

