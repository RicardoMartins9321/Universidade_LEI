clear all;
clc;

a1 = 0.2;
a2 = 0.3;
a3 = 0.1;
a4 = 0.45;

%     1    2    3    4    5    Meta
T = [ 0    0    0    0    0    0;   % 1
      a1   0    0    0    0    0;   % 2      
      0    0    0    a4   a2   0;   % 3
      0    0    a3   0    1-a2 0;   % 4
      1-a1 1    1-a3 0    0    0;   % 5
      0    0    0    1-a4 0    1 ]; % Meta

% M igual a T pois só existe um estado absorvente meta que já está no final
% da matriz, logo não é preciso rearranjar os estados
M = T;

Q = M(1:5,1:5);

%% b)
N = 1e6;
sum = 0;

for n = 1:N
    % função que dada a matriz de transiçoes T, o estado inicial e o(s)
    % estado(s) absorventes, gera uma sequência aleatória para cada caso
    state = crawl(T, 1, 6);
    if length(state) == 4
        sum = sum + 1;
    end
end

probTeo = (1-a1) * (1-a2) * (1-a4);
probSim = sum/N;

fprintf("Probabilidade Teórica do menor percurso: %6.4f\n", probTeo)
fprintf("Probabilidade Simulada do menor percurso: %6.4f\n", probSim);

%% c)
% F representa o número médio de visitas a cada estado antes da absorção
F = inv(eye(length(Q)) - Q);

E = sum(F);
fprintf("Nº passos a começar em 1: %f\n", E(1)+1);

%%
markov_absorvent_info(T)
markov_steady_state(T)
