%% Ex2.1.5 a)
n = 2;      % numero de sequencias de palavras
N = 1e5;    % numero de simulações
m = 3;      % numero de palavras

% gera uma tabela com 2 rows, 1e5 cols e com valores de 1 a 3
sequencias = randi(m,n,N);

contadorA = 0;
contadorB = 0;
contadorC = 0;
contadorD = 0;

% for loop para iterar por todas as colunas da tebela que criamos
for c = 1:N
    %A
    % verifica se a sequencia tem a palavra 1 e a palavra 2
    if sequencias(1,c) == 1 && sequencias(2,c) == 2
        contadorA = contadorA+1;
    end
    %B
    % verificar se na sequencia aparece pelo menos um 'um'
    if sequencias(1,c) == 1 || sequencias(2,c) == 1
        contadorB = contadorB+1;
    end
    %C
    % verifica se na sequencia aparece ou 'um' ou 'dois' em ambas as
    % posições da sequencia
    if sequencias(1,c) == 1 || sequencias(2,c) == 1 || sequencias(1,c) == 2 || sequencias(2,c) == 2
        contadorC = contadorC +1;
    end
  
end

% A probabilidade depois é calculada ao fazer o número de casos favoráveis
% a dividir pelo númeor de casos possiveis ou seja o número total de
% simulações N
probA = contadorA/N
probB = contadorB/N
probC = contadorC/N