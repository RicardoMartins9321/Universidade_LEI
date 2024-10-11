%% Ex2.1.2 a)
N = 1e5;    % numero total de experiencias
n = 20;     % numero de lançamentos por experiencia
m = 100;    % numero de alvos
contador = 0;

% gera uma tabela com 20 rows, 1e5 cols e com valores de 1 a 100
experincias = randi(m,n,N);

for k=1:N
    sem_rep = unique(experincias(:,k));  
    if length(sem_rep)==20
        contador = contador+1;
    end
end

probA = contador/N

%% Ex2.1.2 b)
N = 1e5;    % numero total de simulações
n = 20;     % numero de lançamentos por experiencia
m = 100;    % numero de alvos
contadorB = 0;

% gera uma tabela com 20 rows, 1e5 cols e com valores de 1 a 100
experincias = randi(m,n,N);

for k=1:N
    sem_rep = unique(experincias(:,k));  
    if length(sem_rep)~=20
        contadorB = contadorB+1;
    end
end

probB = contadorB/N
%% Ex2.1.2 c)
% Definir os valores de m (número de alvos)
m_values = [1000, 100000];

% Definir o número de dardos
n_values = 10:10:100;

% Inicializar matriz para armazenar as probabilidades
probabilidades = zeros(length(m_values), length(n_values));

% Realizar as simulações para cada valor de m e n
for i = 1:length(m_values)
    for j = 1:length(n_values)
        % Definir o número de alvos e dardos
        m = m_values(i);
        n = n_values(j);
        
        % Definir o número de simulações
        numSimulacoes = 1000;
        
        % Inicializar contador de alvos atingidos duas ou mais vezes
        contagem = 0;
        
        % Realizar as simulações
        for k = 1:numSimulacoes
            % Gerar uma matriz aleatória de lançamentos de dardos
            lancamentos = randi(m, n, 1);
            
            % Verificar se há algum alvo atingido duas ou mais vezes
            if max(histcounts(lancamentos, 1:m)) >= 2
                contagem = contagem + 1;
            end
        end
        
        % Calcular a probabilidade estimada
        probabilidade = contagem / numSimulacoes;
        
        % Armazenar a probabilidade na matriz
        probabilidades(i, j) = probabilidade;
    end
end

% Plotar os gráficos
figure
subplot(2, 1, 1)
plot(n_values, probabilidades(1, :))
xlabel('Número de Dardos (n)')
ylabel('Probabilidade')
title('m = 1000 Alvos')

subplot(2, 1, 2)
plot(n_values, probabilidades(2, :))
xlabel('Número de Dardos (n)')
ylabel('Probabilidade')
title('m = 100000 Alvos')

%% Ex2.1.2 d)
N = 1e5;
m = [200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000];
n = 100;
probabilidades = zeros(length(m));

for k = 1: length(m)
    lancamentos = randi(m(k), n, N);
    sucessos = 0;
    for i = 1: N
        if length(unique(lancamentos(:, i))) <= n -1
            sucessos = sucessos +1;
        end 
    end
    probabilidades(k) = sucessos/N;
end 

plot(m, probabilidades)
