clear all;


%     1    2    3    4    5    
T = [ 0    0    0.9  0    0;   % 1
      1    0    0    0    0;   % 2      
      0    0.9  0    0    0;   % 3
      0    0.1  0    1    0;   % 4
      0    0    0.1  0    1];   % 5

% M igual a T pois só existe um estado absorvente meta que já está no final
% da matriz, logo não é preciso rearranjar os estados
M = T;

Q = M(1:3,1:3);

%% b)
x0 = [1 0 0 0 0]';

T15 = T^14*x0;

prob1 = T15(1,1);
disp(sum(T15));
fprintf("Prob estado 1 %f\n", prob1)

%% c)
% F representa o número médio de visitas a cada estado antes da absorção
F = inv(eye(length(Q)) - Q);

E = sum(F);
fprintf("Nº médio de iterações a começar em 1: %f\n", E(1)+1);

%% d)
N = 1e6;
soma4 = 0;
soma5 = 0;

for n = 1:N
    % função que dada a matriz de transiçoes T, o estado inicial e o(s)
    % estado(s) absorventes, gera uma sequência aleatória para cada caso
    state = crawl(T, 1, [4,5]);
    if state(end) == 4
        soma4 = soma4 + 1;
    elseif state(end) == 5
        soma5 = soma5 +1;
    end
end

prob4 = soma4/N;
prob5 = soma5/N;

fprintf("Probabilidade absorção estado 4: %6.4f\n", prob4);
fprintf("Probabilidade absorção estado 5: %6.4f\n", prob5);

%%
markov_absorvent_info(T)
markov_steady_state(T)