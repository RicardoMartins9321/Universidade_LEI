% Carrega as chaves produzidas no exercicio 1
load keysA.mat

hashTableSizes = [5e5, 1e6, 2e6];
numHashFunctions = 4;

figure; % cria a figura

% Loop mais exterior para iterar sobre as diferentes funções 
for hashFuncIdx = 1:numHashFunctions
    % Switch case para definir qual a função hash a ser usada
    switch hashFuncIdx
        case 1
            hashFunc = @(key, size) hashstring(key, size);
            hashFuncName = 'hashstring';
        case 2
            hashFunc = @(key, size) string2hash(key, 'djb2');
            hashFuncName = 'string2hash (djb2)';
        case 3
            hashFunc = @(key, size) string2hash(key, 'sdbm');
            hashFuncName = 'string2hash (sdbm)';
        case 4
            hashFunc = @(key, seed) DJB31MA(key, 127);
            hashFuncName = 'DJB31MA';
    end

    % Loop para percorrer cada tamanho de tabela hash
    for T = 1:length(hashTableSizes)
        % Inicializacao das variaveis a usar
        H = zeros(1, length(keysA));        % guardar os hashcodes
        P = zeros(1, hashTableSizes(T));    % guardar o número de atribuições
        collisions = 0;                     % guardar as colisões
        t = tic;

        % for loops para obter as hash keys e o numero de colisões
        for i = 1:length(keysA)
            hash = hashFunc(keysA{i}, hashTableSizes(T)); 
            hash = mod(hash, hashTableSizes(T)) + 1;
            H(i) = hash;
            P(hash) = P(hash) + 1;
        end

        for i = 1:hashTableSizes(T)
            if P(i) > 1
                collisions = collisions + P(i) - 1;
            end
        end

        % Calcular os valores de hash normalizados
        Hnorm = H / hashTableSizes(T);

        % Cria subplot em uma grade 2x4 e selecione o subplot atual
        subplot(numHashFunctions, length(hashTableSizes), (hashFuncIdx - 1) * length(hashTableSizes) + T);
        histogram(H, 100);
        title(sprintf('%s - Table Size = %d', hashFuncName, hashTableSizes(T)));

        % Prints do programa
        fprintf("Function: %s - Table Size: %d\n", hashFuncName, hashTableSizes(T));
        fprintf("Momento 2: teórico=%.5f   medido=%.5f\n", 1/3, mean(Hnorm.^2));
        fprintf("Momento 5: teórico=%.5f   medido=%.5f\n", 1/6, mean(Hnorm.^5));
        fprintf("Momento 10: teórico=%.5f   medido=%.5f\n", 1/11, mean(Hnorm.^10));
        fprintf("Number of collisions=%.d\n", collisions);
        fprintf("Max number of assignments=%d\n", max(P));
        fprintf("Simulation time = %.5f\n", toc(t));
        fprintf("----------------------------------------------------------\n")
    end
end

%%
% Carrega as chaves produzidas no exercicio 1
load keysB.mat

hashTableSizes = [5e5, 1e6, 2e6];
numHashFunctions = 4;

figure; % cria a figura

% Loop mais exterior para iterar sobre as diferentes funções 
for hashFuncIdx = 1:numHashFunctions
    % Switch case para definir qual a função hash a ser usada
    switch hashFuncIdx
        case 1
            hashFunc = @(key, size) hashstring(key, size);
            hashFuncName = 'hashstring';
        case 2
            hashFunc = @(key, size) string2hash(key, 'djb2');
            hashFuncName = 'string2hash (djb2)';
        case 3
            hashFunc = @(key, size) string2hash(key, 'sdbm');
            hashFuncName = 'string2hash (sdbm)';
        case 4
            hashFunc = @(key, seed) DJB31MA(key, 127);
            hashFuncName = 'DJB31MA';
    end

    % Loop para percorrer cada tamanho de tabela hash
    for T = 1:length(hashTableSizes)
        % Inicializacao das variaveis a usar
        H = zeros(1, length(keysB));        % guardar os hashcodes
        P = zeros(1, hashTableSizes(T));    % guardar o número de atribuições
        collisions = 0;                     % guardar as colisões
        t = tic;

        % for loops para obter as hash keys e o numero de colisões
        for i = 1:length(keysB)
            hash = hashFunc(keysB{i}, hashTableSizes(T));
            hash = mod(hash, hashTableSizes(T)) + 1;
            H(i) = hash;
            P(hash) = P(hash) + 1;
        end

        for i = 1:hashTableSizes(T)
            if P(i) > 1
                collisions = collisions + P(i) - 1;
            end
        end

        % Calcular os valores de hash normalizados
        Hnorm = H / hashTableSizes(T);

        % Cria subplot em uma grade 2x4 e selecione o subplot atual
        subplot(numHashFunctions, length(hashTableSizes), (hashFuncIdx - 1) * length(hashTableSizes) + T);
        histogram(H, 100);
        title(sprintf('%s - Table Size = %d', hashFuncName, hashTableSizes(T)));

        % Prints do programa
        fprintf("Function: %s - Table Size: %d\n", hashFuncName, hashTableSizes(T));
        fprintf("Momento 2: teórico=%.5f   medido=%.5f\n", 1/3, mean(Hnorm.^2));
        fprintf("Momento 5: teórico=%.5f   medido=%.5f\n", 1/6, mean(Hnorm.^5));
        fprintf("Momento 10: teórico=%.5f   medido=%.5f\n", 1/11, mean(Hnorm.^10));
        fprintf("Number of collisions=%.d\n", collisions);
        fprintf("Max number of assignments=%d\n", max(P));
        fprintf("Simulation time = %.5f\n", toc(t));
        fprintf("----------------------------------------------------------\n")
    end
end