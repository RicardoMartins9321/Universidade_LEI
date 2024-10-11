% Alfabeto de símbolos e suas frequências
simbolos = ['A', 'B', 'C', 'D', 'E'];
frequencias = [14, 64, 5, 10, 7];

% Número de bits para cada símbolo
% A=00 ; B=1 ; C=0110 ; D=010 ; e=0111
nBits = [2, 1, 4, 3, 4];

% Número total de símbolos na mensagem
CompMesg = 10000;

% Chama a função GeraMensagem
[NumBits1, NumBPS1] = GeraMensagem(frequencias/100, CompMesg, nBits);
[NumBits2, NumBPS2] = GeraMensagem2(frequencias/100, CompMesg, nBits);

% Exibe os resultados
disp(['Número total de bits função v1: ', num2str(NumBits1)]);
disp(['Número médio de bits por símbolo função v1: ', num2str(NumBPS1)]);
disp(['Número total de bits função v2: ', num2str(NumBits2)]);
disp(['Número médio de bits por símbolo função v2: ', num2str(NumBPS2)]);
