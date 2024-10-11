%% Ex 2.1.4 a)
N = 1e5;    % numero total de experiencias
n = 20;     % numero de lançamentos por experiencia
m = 100;    % numero de alvos
contador = 0;

% gera uma tabela com 20 rows, 1e5 cols e com valores de 1 a 100
experincias = randi(m,n,N);

N = 1e5;    % número total de simulações
probA = 0;
n = 1;
d  = 365;   % número de dias

while probA < 0.5
    n = n + 1;
    % gera uma tabela com n rows, 1e5 cols e com valores de 1 a 365
    dias = randi(d ,n ,N);

    contador = 0;
    for c = 1:N
        % vai obter os dias em que várias pessoas tem o mesmo aniversário
        if length(unique(dias(:,c))) ~= n
            contador = contador + 1;
        end
    end

probA = contador/N;

end
fprintf('numero de pessoas %d \n', n);

%% Ex 2.1.4 b)
N = 1e5;
probB = 0;
n = 1;
d  = 365;

while probB < 0.9
    n = n + 1;
    % gera uma tabela com n rows, 1e5 cols e com valores de 1 a 365
    dias = randi(d ,n ,N);

    contador = 0;
    for c = 1:N
        % vai obter os dias em que várias pessoas tem o mesmo aniversário
        if length(unique(dias(:,c))) ~= n
            contador = contador + 1;
        end
    end

probB = contador/N;

end
fprintf('numero de pessoas %d \n', n);
