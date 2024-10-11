%% hashstring(key, tablesize)
% muda para o nome da table que sai da tua função do primeiro 
% exercicio para não teres de estar sempre a correr o algoritmo
load keysA.mat

hashTableSizes = [5*1e5 1e6 2*1e6];
N = length(keysA);

for T = 1:length(hashTableSizes)
    H = zeros(1,N); % guardar os hashcodes
    P = zeros(1,hashTableSizes(T)); % guardar o número de atribuições
    collisions = 0; % guardar o número de colisões
    t = tic;

    for i = 1:N
        hash = hashstring(keysA{i}, hashTableSizes(T));
        hash = mod(hash,hashTableSizes(T)) + 1;
        H(i) = hash;
        P(hash) = P(hash) + 1;
    end
    for i= 1:hashTableSizes(T)
        if P(i)>1
            collisions = collisions + P(i) - 1;
        end
    end
    tempo =  toc(t);    % guardar o tempo de execução
    
    % Create subplots in a 1x3 grid and select the current subplot
    subplot(1, 3, T);
    histogram(H,100);
    title(sprintf('Size = %d', hashTableSizes(T)));
    
    fprintf("TableSize: %d\n", hashTableSizes(T))
    Hnorm = H/hashTableSizes(T);
    fprintf("Momento 2: teórico=%.5f   medido=%.5f\n", 1/3, mean(Hnorm.^2));
    fprintf("Momento 5: teórico=%.5f   medido=%.5f\n", 1/6, mean(Hnorm.^5));
    fprintf("Momento 10: teórico=%.5f   medido=%.5f\n", 1/11, mean(Hnorm.^10));
    
    fprintf("Number of collisions=%.d\n", collisions);
    fprintf("Max number of assignements=%d\n", max(P));
    fprintf("Simulation time = %.5f\n", tempo)
    fprintf("------------------------------------\n")
end

%% string2hash(string,type)
% muda para o nome da table que sai da tua função do primeiro 
% exercicio para não teres de estar sempre a correr o algoritmo
load keysA.mat

hashTableSizes = [5*1e5 1e6 2*1e6];
N = length(keysA);

for T = 1:length(hashTableSizes)
    H = zeros(1,N); % guardar os hashcodes
    P = zeros(1,hashTableSizes(T)); % guardar o número de atribuições
    collisions = 0; % guardar o número de colisões
    t = tic;

    for i = 1:N
        hash = string2hash(keysA{i}, 'djb2');
        hash = mod(hash,hashTableSizes(T)) + 1;
        H(i) = hash;
        P(hash) = P(hash) + 1;
    end
    for i= 1:hashTableSizes(T)
        if P(i)>1
            collisions = collisions + P(i) - 1;
        end
    end
    tempo =  toc(t);    % guardar o tempo de execução
    
    % Create subplots in a 2x3 grid and select the current subplot
    subplot(2, 3, T);
    histogram(H,100);
    title(sprintf('Hash Table Size = %d', hashTableSizes(T)));
    
    fprintf("TableSize: %d\n", hashTableSizes(T))
    Hnorm = H/hashTableSizes(T);
    fprintf("Momento 2: teórico=%.5f   medido=%.5f\n", 1/3, mean(Hnorm.^2));
    fprintf("Momento 5: teórico=%.5f   medido=%.5f\n", 1/6, mean(Hnorm.^5));
    fprintf("Momento 10: teórico=%.5f   medido=%.5f\n", 1/11, mean(Hnorm.^10));
    
    fprintf("Number of collisions=%.d\n", collisions);
    fprintf("Max number of assignements=%d\n", max(P));
    fprintf("Simulation time = %.5f\n", tempo)
    fprintf("------------------------------------\n")

    H = zeros(1,N); % guardar os hashcodes
    P = zeros(1,hashTableSizes(T)); % guardar o número de atribuições
    collisions = 0; % guardar o número de colisões
    t = tic;

    for i = 1:N
        hash = string2hash(keysA{i}, 'sdbm');
        hash = mod(hash,hashTableSizes(T)) + 1;
        H(i) = hash;
        P(hash) = P(hash) + 1;
    end
    for i= 1:hashTableSizes(T)
        if P(i)>1
            collisions = collisions + P(i) - 1;
        end
    end
    tempo =  toc(t);    % guardar o tempo de execução
    
    % Create subplots in a 2x3 grid and select the current subplot
    subplot(2, 3, T+3);
    histogram(H,100);
    title(sprintf('Hash Table Size = %d', hashTableSizes(T)));
    
    fprintf("TableSize: %d\n", hashTableSizes(T))
    Hnorm = H/hashTableSizes(T);
    fprintf("Momento 2: teórico=%.5f   medido=%.5f\n", 1/3, mean(Hnorm.^2));
    fprintf("Momento 5: teórico=%.5f   medido=%.5f\n", 1/6, mean(Hnorm.^5));
    fprintf("Momento 10: teórico=%.5f   medido=%.5f\n", 1/11, mean(Hnorm.^10));
    
    fprintf("Number of collisions=%.d\n", collisions);
    fprintf("Max number of assignements=%d\n", max(P));
    fprintf("Simulation time = %.5f\n", tempo)
    fprintf("------------------------------------\n")
end

%% DJB31MA(key,seed)
% muda para o nome da table que sai da tua função do primeiro 
% exercicio para não teres de estar sempre a correr o algoritmo
load keysA.mat

hashTableSizes = [5*1e5 1e6 2*1e6];
N = length(keysA);

for T = 1:length(hashTableSizes)
    H = zeros(1,N); % guardar os hashcodes
    P = zeros(1,hashTableSizes(T)); % guardar o número de atribuições
    collisions = 0; % guardar o número de colisões
    t = tic;

    for i = 1:N
        hash = DJB31MA(keysA{i}, 127);
        hash = mod(hash,hashTableSizes(T)) + 1;
        H(i) = hash;
        P(hash) = P(hash) + 1;
    end
    for i= 1:hashTableSizes(T)
        if P(i)>1
            collisions = collisions + P(i) - 1;
        end
    end
    tempo =  toc(t);    % guardar o tempo de execução
    
    % Create subplots in a 1x3 grid and select the current subplot
    subplot(1, 3, T);
    histogram(H,100);
    title(sprintf('Hash Table Size = %d', hashTableSizes(T)));
    
    fprintf("TableSize: %d\n", hashTableSizes(T))
    Hnorm = H/hashTableSizes(T);
    fprintf("Momento 2: teórico=%.5f   medido=%.5f\n", 1/3, mean(Hnorm.^2));
    fprintf("Momento 5: teórico=%.5f   medido=%.5f\n", 1/6, mean(Hnorm.^5));
    fprintf("Momento 10: teórico=%.5f   medido=%.5f\n", 1/11, mean(Hnorm.^10));
    
    fprintf("Number of collisions=%.d\n", collisions);
    fprintf("Max number of assignements=%d\n", max(P));
    fprintf("Simulation time = %.5f\n", tempo)
    fprintf("------------------------------------\n")

end
