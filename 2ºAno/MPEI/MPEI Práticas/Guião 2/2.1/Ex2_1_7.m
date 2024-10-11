%% Ex2.1.7 a) Valor teórico
N = 1e5;    % numero de simulações
numProgsAndre = 20;      
numProgsBruno = 30;
numProgsCarlos = 50;
numTotalProgs = numProgsAndre+numProgsBruno+numProgsCarlos;

PE_A=0.01;  %P(Erro|André)
PE_B=0.05;  %P(Erro|Bruno)
PE_C=0.001; %P(Erro|Carlos)

% rand(n, N) cria um array com n rows e N colunas de valores entre 0 e 1
% depois ao verificar se está debaixo do valor da prob de estar errado vai
% criar arrays com os números lógicos, nos quais os 1 são aqueles que têm
% erros e a soma das colunas dará o número de programas com erros em cada simulação 
programasAndre = rand(20,N) <=0.01;
programasBruno = rand(30,N) <=0.05;
programasCarlos = rand(50,N) <=0.001;

M = [programasAndre; programasBruno; programasCarlos];

P_A = numProgsAndre/numTotalProgs;    % prob de o andré ser escolhido
P_B = numProgsBruno/numTotalProgs;    % prob de o bruno ser escolhido
P_C = numProgsCarlos/numTotalProgs;   % prob de o carlos ser escolhido

% A probabilidade é calculada ao dividir o número de casos favoráveis pelo 
% número de casos possiveis ou seja o número total de simulações N
% sum(M) dá-nos a um vetor linha com o número de erros em cada uma das
% simulações, o segundo sum dá-nos o valor de erros em todas as simulações
P_E = sum(sum(M))/(N*100);  % N*100 para fazer o total dos programas

% probabilidade do programa com erro ser do carlos é igual a prob de um
% programa que o Carlos faz tem erro * a prob do porgrama escolhido ser o
% do carlos a dividir pela prob total de existirem erros
PC_E = (PE_C * P_C) / P_E

%% Ex2.1.7 a) Valor simulação
% Inicializar o número de programas e probabilidades de bugs para cada programador
num_programas = [20, 30, 50];
prob_bugs = [0.01, 0.05, 0.001];

% Inicializar o número total de programas
total_programas = sum(num_programas);

% Inicializar um vetor para armazenar os programadores responsáveis por cada programa
programadores = zeros(1, total_programas);

% Atribuir cada programa a um programador com base no número de programas que eles produziram
programadores(1:num_programas(1)) = 1; % Andre
programadores(num_programas(1)+1:num_programas(1)+num_programas(2)) = 2; % Bruno
programadores(num_programas(1)+num_programas(2)+1:total_programas) = 3; % Carlos

% Inicializar um vetor para armazenar se cada programa tem um bug ou não
bugs = zeros(1, total_programas);

% Para cada programa, gerar um número aleatório e verificar se é menor que a probabilidade de bug do programador responsável
for i = 1:total_programas
    if rand < prob_bugs(programadores(i))
        bugs(i) = 1;
    end
end

% Calcular a probabilidade de um programa bugado ser do Carlos
prob_Carlos_bug = sum(bugs(programadores == 3)) / sum(bugs)


%% Ex2.1.7 b)
PFA = (P_A * PE_A)/P_E
PFB = (P_B * PE_B)/P_E
PFC = (P_C * PE_C)/P_E
