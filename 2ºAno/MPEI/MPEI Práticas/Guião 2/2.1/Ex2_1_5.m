%% Ex2.1.5 a) Versão mais lenta
n = 2;      % numero de dados
N = 1e5;    % numero de simulações
m = 6;      % numero de faces

% gera uma tabela com 2 rows, 1e5 cols e com valores de 1 a 6
lancamentos = randi(m,n,N);

contadorA = 0;
contadorB = 0;
contadorC = 0;
contadorD = 0;

tic
% for loop para iterar por todas as colunas da tebela que criamos
for coluna = 1:N
    %A
    % caso a soma dos valores da coluna c, ou seja caso o valor das faces
    % dos dois dados, seja igual ao 9 adicionamos ao contador A
    soma = lancamentos(1,coluna)+lancamentos(2,coluna);
    if soma == 9
        contadorA = contadorA+1;
    end
    %B
    % se o valor do resto da divisão inteira por 2 do valor do segundo dado
    % for igual a zero significa que é um número par e por isso adiciona-se
    % ao contador B dos casos favoráveis
    if rem(lancamentos(2,coluna),2) == 0
        contadorB = contadorB+1;
    end
    %C
    % verifica se o valor do primeiro dado ou do segundo dado é igual a 5
    if lancamentos(1,coluna) == 5 || lancamentos(2,coluna) == 5
        contadorC = contadorC +1;
    end
    %D
    % verifica que nenhum dos valores dos dados é igual a 1
    if lancamentos(1,coluna) ~= 1 && lancamentos(2,coluna) ~= 1
        contadorD = contadorD+1;
    end
end
toc

% A probabilidade depois é calculada ao fazer o número de casos favoráveis
% a dividir pelo númeor de casos possiveis ou seja o número total de
% simulações N
probA = contadorA/N
probB = contadorB/N
probC = contadorC/N
probD = contadorD/N

%% Ex2.1.5 a) Versão mais rápida
tic
% usando a função sum na matriz dos lançamentos enquanto que ao mesmo tempo
% verificamos se este valor é igual a zero vai nos dar um vetor lógico(0s e 1s)
% de dimensões 1 row e N colunas. Ao calcularmos de novo a sum sobre este vetor
% vai nos dar a soma de todos os elementos pelo que já nos dá o valor correto
% pois só os que deram 1, ou sejam estavam corretos, é que contam para a soma.
contadorA = sum(sum(lancamentos) == 9);

toc
probA = contadorA/N
