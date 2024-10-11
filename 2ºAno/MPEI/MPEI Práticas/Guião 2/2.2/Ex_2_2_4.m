%% Ex 2.2.4 a)
%i)
% função massa de probabilidade P(X=xi)

% Espaço de amostragem em que nas 5 peças tomadas o número das peças
% defeituosas pode ser entre 0 a 5
Sx = 0:5;   
N = 1e6;    % número de simulações
p = 3/10;    % probabilidade de ser uma peça defeituosa

% criar um array de números aleatórios com 5 linhas e N colunas e guardar
% os valores lógicos se são inferiores à probabilidade de ser defeituosa,3/10
defeituosas = rand(5,N) < p;

defeituosa0 = sum(sum(defeituosas) == 0);
defeituosa1 = sum(sum(defeituosas) == 1);
defeituosa2 = sum(sum(defeituosas) == 2);
defeituosa3 = sum(sum(defeituosas) == 3);
defeituosa4 = sum(sum(defeituosas) == 4);
defeituosa5 = sum(sum(defeituosas) == 5);

prob0 = defeituosa0/N; % prob de sair 0 defeituosas
prob1 = defeituosa1/N; % prob de sair 1 defeituosas
prob2 = defeituosa2/N; % prob de sair 2 defeituosas
prob3 = defeituosa3/N; % prob de sair 3 defeituosas
prob4 = defeituosa4/N; % prob de sair 4 defeituosas
prob5 = defeituosa5/N; % prob de sair 5 defeituosas


fprintf("Px(0)= %.6f\nPx(1)= %.6f\nPx(2)= %.6f\nPx(3)= %.6f\nPx(4)= %.6f\n Px(5)= %.6f\n" ...
    , prob0, prob1, prob2, prob3, prob4, prob5)

probs = [prob0 prob1 prob2 prob3 prob4 prob5];

stem(Sx,probs)
axis([-0.5 5.5 0 0.5])

% ii)
% função distribuição acumulada Fx(x) = Px(X<=x) = somatório de i até xi<x de px(x)

% função já existente do MATLAB que faz o somatório dos valores para cada
% elemento fazendo um array com o mesmo tamnho daquele que lhe foi dado.
Fx = cumsum(probs);

stairs([-1 Sx 6],[0 Fx 1])

axis([-0.5 5.5 0 1.1])
xlabel("x"); 
ylabel("Fx(x)");
grid on;

% iii)
maximo_2defeituosas = sum(sum(defeituosas) <=2);

prob_analitica_maximo2 = maximo_2defeituosas/N % prob de sair máximo 2 defeituosas


%% Ex 2.2.4 b)
% i)
prob_teorica0 = prob_teorica(0,5,0.3);
prob_teorica1 = prob_teorica(1,5,0.3);
prob_teorica2 = prob_teorica(2,5,0.3);
prob_teorica3 = prob_teorica(3,5,0.3);
prob_teorica4 = prob_teorica(4,5,0.3);
prob_teorica5 = prob_teorica(5,5,0.3);

probsTeo=[prob_teorica0 prob_teorica1 prob_teorica2 prob_teorica3 prob_teorica4 prob_teorica5];

probTeoAcumulada = cumsum(probsTeo)

% ii)
prob_teorica_maximo2 = prob_teorica0 + prob_teorica1 + prob_teorica2
