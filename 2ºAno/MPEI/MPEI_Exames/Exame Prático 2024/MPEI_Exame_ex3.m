clear all;

cellArray = readcell("cars3.xlsx", "NumHeaderLines",1);
Equipa1 = cellArray(1,:);
Equipa2 = cellArray(2,:);
Equipa3 = cellArray(3,:);
Equipa4 = cellArray(4,:);
%%
numEquipas = 4; % Número de frases
numHashFuncs = 4;  % Número de funções de hash
shingleSize = 3; % Tamanho dos shingles

% Inicializa a matriz de MinHash para cada frase
MinHashFrases = zeros(numEquipas, numHashFuncs);

% Itera sobre cada frase calculando o minHash
for numEquipa=1:numEquipas
    Equipa = cellArray{1,numEquipa}; % Recupera a equipa atual

    % Itera sobre cada função de hash
    for numHashFunc=1:numHashFuncs
        % Armazena os hashes para cada shingle
        hashArray = zeros(1,strlength(Equipa)-shingleSize+1);
        % Itera sobre cada shingle na frase e calcula valores de hash
        for numShingle=1:strlength(Equipa)-shingleSize+1
            % Extrai o shingle da frase
            key = char(Equipa(numShingle:(numShingle+shingleSize-1)));
            % Calcula o hash e armazena no array
            hashArray(numShingle) = hf24(key,numHashFunc)+1;
        end
        % Armazena o menor hash para cada função de hash
        MinHashFrases(numEquipa,numHashFunc) = min(hashArray);
    end
end

% Inicializa a matriz de distância
Distance = zeros(4,4);

% Calcula a distância entre as assinaturas de MinHash das equipas
for n1=1:length(MinHashFrases)
    for n2=n1:length(MinHashFrases)
        % Verifique quantos valores de hash correspondem entre as duas equipas
        isMatch = MinHashFrases(n1,:)==MinHashFrases(n2,:);
        % Calcule e armazene a distância Jaccard
        Distance(n1,n2) = 1-sum(isMatch)/length(isMatch);
    end
end
