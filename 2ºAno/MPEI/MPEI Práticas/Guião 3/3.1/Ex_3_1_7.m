%% 3.1.7 a)

% os valores na matriz vão ser igual a prob de sair de um estado para o
% outro, visto que a prob de sair para um qualquer estado para outro são
% iguais, temos apenas de fazer 1 a dividir pelo número de saidas
% diferentes em cada estado. Por exemplo, o estado E tem 3 saidas logo  a
% prob de transitar para qualquer um dos estados de E para A ou B ou F será
% igual a 1/3
% Matriz 6x6
%    A B C D  E F
H = [0 0 0 0 1/3 0 ; % A
    1 0 0 0 1/3 0 ;  % B
    0 1/2 0 1 0 0 ;  % C
    0 0 1 0 0 0 ;    % D
    0 1/2 0 0 0 0 ;  % E
    0 0 0 0 1/3 0];  % F

pageRankA = (ones(1,6)/6)';

for i = 1:10
    pageRankA = H * pageRankA;
end

disp("PageRank ao final de 10 iterações:")
disp(pageRankA)
%% 3.1.7 b)
disp("Spider Trap é o estado C e D")
disp("Dead end é o estado F")

%% 3.1.7 c)
%    A  B   C   D   E   F
H = [0  0   0   0   1/3 1/6 ;  % A
     1  0   0   0   1/3 1/6 ;  % B
     0  1/2 0   1   0   1/6 ;  % C
     0  0   1   0   0   1/6 ;  % D
     0  1/2 0   0   0   1/6 ;  % E
     0  0   0   0   1/3 1/6];  % F

pageRankC = (ones(1,6)/6)';

for i = 1:10
    pageRankC = H * pageRankC;
end

disp("PageRank ao final de 10 iterações:")
disp(pageRankC)
%% 3.1.7 d)
%    A  B   C   D   E   F
H = [0  0   0   0   1/3 1/6 ;  % A
     1  0   0   0   1/3 1/6 ;  % B
     0  1/2 0   1   0   1/6 ;  % C
     0  0   1   0   0   1/6 ;  % D
     0  1/2 0   0   0   1/6 ;  % E
     0  0   0   0   1/3 1/6];  % F

pageRankD = (ones(1,6)/6)';
beta = 0.8;
A = beta*H + (1-beta)*ones(length(H),length(H))/6;

for i = 1:10
    pageRankD = A * pageRankD;
end

disp("PageRank ao final de 10 iterações:")
disp(pageRankD)

%% 3.1.7 e)
%    A  B   C   D   E   F
H = [0  0   0   0   1/3 1/6 ;  % A
     1  0   0   0   1/3 1/6 ;  % B
     0  1/2 0   1   0   1/6 ;  % C
     0  0   1   0   0   1/6 ;  % D
     0  1/2 0   0   0   1/6 ;  % E
     0  0   0   0   1/3 1/6];  % F

pageRankE = (ones(1,6)/6)';
beta = 0.8;
A = beta*H + (1-beta)*ones(length(H),length(H))/6;
iteracoes = 1;
valor_maximo = 1e-4;

% vai iterando a matriz do pageRank ao longo do tempo até que seja
% encontrado o número de iterações que produz uma matriz pagRank em que nenhum
% valor varia mais do que a variavel valor_maximo
while true
    pageRankE_Old = pageRankE;
    pageRankE = A*pageRankE;
    if max(abs(pageRankE-pageRankE_Old)) < valor_maximo
        break;
    end
    iteracoes = iteracoes +1;
end

fprintf("Número de iterações necessárias: %d\n", iteracoes)
