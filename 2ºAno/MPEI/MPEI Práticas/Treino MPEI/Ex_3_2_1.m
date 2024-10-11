%% Ex 3.2.1 a)
% Parte com Fórmulas
M = [0.8 0 0.3 0 0 ;  % 1
    0.2 0.6 0.2 0 0 ; % 2
    0 0.1 0.4 0 0 ;   % 4
    0 0.3 0 1 0 ;     % 3
    0 0 0.1 0 1];     % 5

Q = M(1:3,1:3);
% F representa o número médio de visitas a cada estado antes da absorção
F = inv(eye(length(Q))-Q);
R = M(4:5, 1:3);
B = R*F;
E = sum(F);

% Parte simulada
T = [0.8 0 0 0.3 0 ;  % 1  
    0.2 0.6 0 0.2 0 ; % 2
    0 0.3 1 0 0 ;     % 3
    0 0.1 0 0.4 0 ;   % 4
    0 0 0 0.1 1 ];     % 5

N = 1e5;    % número de simulações
Sum1 = 0;
Sum2 = 0;
Sum4 = 0;
count3 = 0; % número de vezes em que o estado absorvente foi o 3
count5 = 0; % número de vezes em que o estado absorvente foi o 5

for n = 1:N
    % função que dada a matriz de transiçoes T, o estado inicial e o(s)
    % estado(s) absorventes, gera uma sequência aleatória para cada caso
    estado1 = crawl(T, 1, [3,5]);
    estado2 = crawl(T, 2, [3,5]);
    estado4 = crawl(T, 4, [3,5]);
    
    if estado1(end) == 3
        count3 = count3 + 1;
    end
    if estado1(end) == 5
        count5 = count5 + 1;
    end

    Sum1 = Sum1 + length(estado1)-1;
    Sum2 = Sum2 + length(estado2)-1;
    Sum4 = Sum4 + length(estado4)-1;
end

% Fazemos a soma do comprimento que o caminho aleatório gerado pela funcção
% crawl gerou para chegar da posição inicial até chegar ao estado
% absorvente para todas as simulções e de seguida dividimos esse valor pelo
% número total de simulações para assim obter a média
E1 = Sum1/N;
E2 = Sum2/N;
E4 = Sum4/N;
p3 = count3/N;
p5 = count5/N;

% Prints de ambos
fprintf("Nº passos a começar em 1 Fórmula: %f\n", E(1));
fprintf("Nº passos a começar em 2 Fórmula: %f\n", E(2));
fprintf("Nº passos a começar em 4 Fórmula: %f\n", E(3));
fprintf("Nº passos a começar em 1 Simulada: %f\n", E1);
fprintf("Nº passos a começar em 2 Simulada: %f\n", E2);
fprintf("Nº passos a começar em 4 Simulada: %f\n", E4);

fprintf("Começando no estado 1, prob absorção do estado 3 Fórmula: %f\n", B(1,1));
fprintf("Começando no estado 1, prob absorção do estado 3 Simulada: %f\n", p3);
fprintf("Começando no estado 1, prob. absorção do estado 5 Fórmula: %f\n", B(2,1));
fprintf("Começando no estado 1, prob. absorção do estado 5 Simulada: %f\n", p5);

%% Ex 3.2.1 b)
% Parte simulada
T = [0.8 0 0 0.3 0 ;  % 1  
    0.2 0.6 0 0.2 0 ; % 2
    0 0.3 1 0 0 ;     % 3
    0 0.1 0 0.4 0 ;   % 4
    0 0 0 0.1 1 ];    % 5

N = 1e5;  % número de simulações
array = cell(1,N);  % criar um cell array com 1 linha por N colunas

for n = 1:N
    % estados absorventes são o 3 e 5, e os estados que queremos são 1, 2, 4
    % assim podemos usar o randi(3) que origina um inteiro entre 1 e 3 e como
    % o número 3 é um estado absorvente sempre que randi retornar 3 alteramos 
    % o valor para 4, e assim temos igual prob de obter 1, 2, 4
    rand = randi(3);
    if rand == 3
        rand = 4;
    end

    % vetor do percurso aleatório desde a posição inicial até à absorvente
    estadoRand = crawl(T, rand, [3 5]); 

    array{n} = estadoRand;  % passar o estado para o cell array
end

% definir os valores max e min para o primeiro valor do cell array
max = length(array{1});
min = length(array{1});

% loop que começa a iterar a partir da segunda posição visto que já obtive o 
% valor da primeira. Depois vai iterando, verificando se o valor na posição
% n do cell array é maior ou menor do que o max e min respetivamente, caso
% seja vai alterar os valores das variaveis para o encontrado nessa iteração
for n = 2:N
    if length(array{n}) > max
        max = length(array{n});
    end

    if length(array{n}) < min
        min = length(array{n});
    end
end

fprintf("Comprimento máximo: %d\n", max);
fprintf("Comprimento minimo: %d\n", min);