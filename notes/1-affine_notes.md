# Affine notes
- Os artigos dizem que o filtro de interpolação do affine tem 8 taps, mas há uns 7 meses atrás teve uma atualização no Git e tem novos coeficientes para o affine do VVC, com o nome *m_affineLumaFilter*, que tem 8 taps poorém os 2 últimos taps são todos iguais a 0. 
- > Vou considerar o cálculo com 8 taps, mesmo que sejam zerados