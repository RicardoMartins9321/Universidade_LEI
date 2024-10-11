%% Ex 2.2.3 a)
% função massa de probabilidade P(X=xi)

% Espaço de amostragem em que nos 4 lançamentos podem acontecer, de 0 até 
% 4 coroas no total dos 4 lançamentos
Sx = 0:4;   
N = 1e6;    % número de simulações
p = 1/2;    % probabilidade de cara ou coroa

% criar um array de números aleatórios com 4 linhas e N colunas e guardar
% os valores lógicos se são inferiores à probabilidade de sair cara, 1/2
lancamento = rand(4,N) < p;

% fazendo a soma dos valores lógicos das colunas vai nos dar o número de
% coroas que sairam em cada simulação, depois voltamos a fazer sum destes
% valores para obter o número total de simualções que verificaram cada situação especifica 
num0 = sum(sum(lancamento) == 0);
num1 = sum(sum(lancamento) == 1);
num2 = sum(sum(lancamento) == 2);
num3 = sum(sum(lancamento) == 3);
num4 = sum(sum(lancamento) == 4);

prob0 = num0/N; % prob de sair 0 coroas
prob1 = num1/N; % prob de sair 1 coroas
prob2 = num2/N; % prob de sair 2 coroas
prob3 = num3/N; % prob de sair 3 coroas
prob4 = num4/N; % prob de sair 4 coroas


fprintf("Px(0)= %.6f\nPx(1)= %.6f\nPx(2)= %.6f\nPx(3)= %.6f\nPx(4)= %.6f\n" ...
    , prob0, prob1, prob2, prob3, prob4)


%% Ex 2.2.3 b)
Sx = 0:4;   
N = 1e6;    % número de simulações
p = 1/2;    % probabilidade de cara ou coroa

lancamento = rand(4,N) < p;

num0 = sum(sum(lancamento) == 0);
num1 = sum(sum(lancamento) == 1);
num2 = sum(sum(lancamento) == 2);
num3 = sum(sum(lancamento) == 3);
num4 = sum(sum(lancamento) == 4);

prob0 = num0/N; % prob de sair 0 coroas
prob1 = num1/N; % prob de sair 1 coroas
prob2 = num2/N; % prob de sair 2 coroas
prob3 = num3/N; % prob de sair 3 coroas
prob4 = num4/N; % prob de sair 4 coroas

probs = [prob0 prob1 prob2 prob3 prob4];

% Fórmulas que estão nos slides teóricos
valor_esperado = sum(Sx.*probs);
variancia = sum((Sx.^2).*probs) - (valor_esperado.^2);
desvio_padrao = sqrt(variancia);

fprintf("Valor Esperado = %.6f \nVariância = %.6f \nDesvio padrão = %.6f\n" ...
    , valor_esperado, variancia, desvio_padrao)
%% Ex 2.2.3 c)
% Exercício teórico

%% Ex 2.2.3 d)
% função massa de probabilidade P(X=xi)

p = 1/2;

prob0Teorica = prob_teorica(0, 4, p);
prob1Teorica = prob_teorica(1, 4, p);
prob2Teorica = prob_teorica(2, 4, p);
prob3Teorica = prob_teorica(3, 4, p);
prob4Teorica = prob_teorica(4, 4, p);

fprintf("Px(0)= %.6f\nPx(1)= %.6f\nPx(2)= %.6f\nPx(3)= %.6f\nPx(4)= %.6f\n" ...
    , prob0Teorica, prob1Teorica, prob2Teorica, prob3Teorica, prob4Teorica)

%% Ex 2.2.3 e)
Sx = 0:4;
p = 1/2;

prob0Teo = prob_teorica(0, 4, p);
prob1Teo = prob_teorica(1, 4, p);
prob2Teo = prob_teorica(2, 4, p);
prob3Teo = prob_teorica(3, 4, p);
prob4Teo = prob_teorica(4, 4, p);

probsTeo = [prob0Teo prob1Teo prob2Teo prob3Teo prob4Teo];

mediaTeo = sum(Sx.*probsTeo);
varTeo = sum((Sx.^2).*probsTeo) - (mediaTeo.^2);
desvio_padraoTeo = sqrt(varTeo);

fprintf("Valor Esperado = %.6f \nVariância = %.6f \nDesvio padrão = %.6f\n" ...
    , mediaTeo, varTeo, desvio_padraoTeo)

%% Ex 2.2.3 f)
% função massa de probabilidade P(X=xi)

p = 1/2;

prob_2coroas = prob_teorica(2, 4, p)+prob_teorica(3, 4, p)+prob_teorica(4, 4, p);
prob_maximo_1coroa = prob_teorica(0, 4, p) + prob_teorica(1, 4, p);
prob_1_a_3coroas = prob_teorica(1, 4, p)+prob_teorica(2, 4, p)+prob_teorica(3, 4, p);

fprintf("Px(i.)= %.4f\nPx(ii.)= %.4f\nPx(iii.)= %.4f\n" ...
    , prob_2coroas, prob_maximo_1coroa, prob_1_a_3coroas)
