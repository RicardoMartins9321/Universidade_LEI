%% Ex 3.2.2 a)
T = [0 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0 1/3 0 0.2 0.1 0 0;
     0 1/3 0.6 0.5 0.4 0.6 0;
     0 1/3 0.4 0 0.3 0 0;
     0 0 0 0.3 0.2 0.4 0]

%% Ex 3.2.2 b)
T = [0 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0 1/3 0 0.2 0.1 0 0;
     0 1/3 0.6 0.5 0.4 0.6 0;
     0 1/3 0.4 0 0.3 0 0;
     0 0 0 0.3 0.2 0.4 0];

N = 1e5;    % número de simulações
CF = 0;

for n = 1:N
    estado = crawl(T, 2, 7);
    if length(estado) == 7
        if estado(end-1) == 6
            CF = CF + 1;
        end
    end
end

prob = CF/N;

fprintf("Prob. de 7 digitos e terminar em 9: %f \n", prob);

%% Ex 3.2.2 c)
T = [0 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0 1/3 0 0.2 0.1 0 0;
     0 1/3 0.6 0.5 0.4 0.6 0;
     0 1/3 0.4 0 0.3 0 0;
     0 0 0 0.3 0.2 0.4 0];

N = 1e5;    % número de simulações
CF = 0;

% Faz a simulação para N e verifica toos os casos favoraveis em que o
% percurso aleatorio desde o estado inicial até ao estado absorvente tem
% comprimento igual a 7
for n = 1:N
    estado = crawl(T, 2, 7);
    if length(estado) == 7
        CF = CF + 1;
    end

end

prob = CF/N;    % casos favoraveis/casos possiveis

fpriSntf("Prob. de 7 digitos: %f \n", prob);