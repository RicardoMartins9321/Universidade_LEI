%% Ex1
% a)
A = (4:2:100);
% b)
B = (5:-1:-5);
% c)
C = linspace(0,1,100);
% d)
D1 = rand(20,30);
D2 = D1(10:15, 9:12);
% e)
E = (-pi: pi/15: pi);
% f)
plot(E, sin(4*pi*E));

%% Ex2 Código 1
% Gerar uma matriz com 3 linhas e 10000 colunas de números aleatórios
% entre 0.0 e 1.0 (ou seja, cada coluna representa uma experieˆncia):
experiencias = rand(3,10000);
% Gerar uma matriz com 3 linhas e 10000 colunas com o valor 1 se o valor
% da matriz anterior for superior a 0.5 (ou seja, se saiu cara) ou com o
% valor 0 caso contra´rio (ou seja, saiu coroa):
lancamentos = experiencias > 0.5; % 0.5 corresponde a 1 - prob. de caras
% Gerar um vetor linha com 10000 elementos com a soma dos valores de cada
% coluna da matriz anterior (ou seja, o nu´mero de caras de cada experieˆncia):
resultados= sum(lancamentos);
% Gerar um vetor linha com 10000 elementos com o valor 1 quando o valor do
% vetor anterior e´ 2 (ou seja, se a experieˆncia deu 2 caras) ou 0 quando e´
% diferente de 2:
sucessos= resultados==2;
% Determinar o resultado final dividindo o nu´mero de experieˆncias com 2
% caras pelo nu´mero total de experieˆncias:
probSimulacao = sum(sucessos)/10000

%% Ex2 Código 2
N= 1e5; %número de experiências
p = 0.5; %probabilidade de cara
k = 2; %número de caras
n = 3; %número de lançamentos
lancamentos = rand(n,N) > p;
sucessos= sum(lancamentos)==k;
probSimulacao2 = sum(sucessos)/N
%% Ex3
N= 1e5; %número de experiências
p = 0.5; %probabilidade de cara
k = 6; %número de caras
n = 15; %número de lançamentos
lancamentos = rand(n,N) > p;
% usa-se o ==k porque assim dá-nos os casos em que n caras é igual a k
sucessos= sum(lancamentos) == k;
probSimulacao3 = sum(sucessos)/N;
%% Ex4
N= 1e5; %número de experiências
p = 1/2; %probabilidade de cara
k = 6; %número de caras
n = 15; %número de lançamentos
lancamentos = rand(n,N) > p;
% usa-se o >=k aqui porque assim dá-nos os acontecimentos em que tem pelo menos 6 caras
sucessos= sum(lancamentos) >= k; 
probSimulacao4 = sum(sucessos)/N

%% Ex5 a)
p = 0.5; % Probabilidade de 'cara'
numExperiencias = 10000; % Número de experiências a realizar

% Para cada número de lançamentos
for numLancamentos = [20 40 100]
    % Para cada número de 'caras' de 0 a numLancamentos
    for numCaras = 0:numLancamentos
        % Estimar a probabilidade e mostrar o resultado
        probabilidade = estimaProbabilidade(p, numLancamentos, numCaras, numExperiencias);
        fprintf('P(%d caras em %d lançamentos) = %.4f\n', numCaras, numLancamentos, probabilidade);
    end
end



%% Ex5 b)
p = 0.5; % Probabilidade de 'cara'
numExperiencias = 10000; % Número de experiências a realizar
numLancamentos = [20 40 100];

for i = 1:length(numLancamentos)
    % Armazene o valor atual de numLancamentos em uma variável
    n = numLancamentos(i);
    
    % Crie um vetor para armazenar as probabilidades estimadas
    probabilidades = zeros(1, n+1);
    
    % Estime a probabilidade para cada número de 'caras' de 0 a n
    for numCaras = 0:n
        probabilidade = estimaProbabilidade(p, n, numCaras, numExperiencias);
        probabilidades(numCaras+1) = probabilidade;
    end
    
    % Crie um novo gráfico usando a função stem
    figure;
    stem(0:n, probabilidades);
    title(sprintf('Probabilidades estimadas para %d lançamentos', n));
    xlabel('Número de caras');
    ylabel('Probabilidade');
end

%% Ex6
% Codigo 2- cálculo analítico de probabilidade em séries experiências de Bernoulli
% function [prob] = probCalculo(p,k,n)
prob1 = probCalculo(0.5,2,3)
prob2 = probCalculo(0.5,6,15)
%% Ex7 a)
numExperiencias = 1e5;
numpecas = 5;
p = 3/10;
pecasdefeituosas = 3;

probSimulacao = probSimulacao(p,numpecas,pecasdefeituosas,numExperiencias);
probCalculo = probCalculo(p,pecasdefeituosas,numpecas)

%% b)
numExperiencias = 1e5;
numpecas = 5;
p = 3/10;
pecasdefeituosas = 2;

probSimulacaoM = probSimulacao(p,numpecas,pecasdefeituosas,numExperiencias);
probCalculo = probCalculo(p,pecasdefeituosas,numpecas);

%% c)
prob = zeros(1,6);
p = 0.3;
n = 5;
N = 10000;

for c = 0:5
    prob(c+1) = probSimulacao(p,n,c,N);
end

stem(0:5,prob);

%% Function 
function probabilidade = estimaProbabilidade(p, numLancamentos, numCaras, numExperiencias)
    % Inicializar o contador de sucessos
    contSucessos = 0;

    % Executar numExperiencias vezes
    for i = 1:numExperiencias
        % Gerar numLancamentos números aleatórios entre 0 e 1
        lancamentos = rand(1, numLancamentos);

        % Contar o número de 'caras' (valores <= p)
        numCarasObtidas = sum(lancamentos <= p);

        % Se o número de 'caras' é igual ao desejado, incrementar o contador de sucessos
        if numCarasObtidas == numCaras
            contSucessos = contSucessos + 1;
        end
    end

    % Calcular a probabilidade como o número de sucessos dividido pelo número de experiências
    probabilidade = contSucessos / numExperiencias;
end
