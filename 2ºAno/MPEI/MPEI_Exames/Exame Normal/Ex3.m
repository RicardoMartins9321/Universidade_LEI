%% Versão 1 - correta
clear all;

% Define as frases a serem analisadas
frase1 = 'Gosto muito de teatro e cinema.';
frase2 = 'O teatro é mais dificil que o cinema.';
frase3 = 'Há muita gente que não gosta de teatro.';
frase4 = 'O teatro e o cinema são duas formas de cultura.';

cellArrayFrases = {frase1, frase2,frase3,frase4}; % Agrupa as frases em uma célula
numFrases = 4; % Número de frases
numHashFuncs = 4;  % Número de funções de hash
shingleSize = 3; % Tamanho dos shingles

% Inicializa a matriz de MinHash para cada frase
MinHashFrases = zeros(numFrases, numHashFuncs);

% Itera sobre cada frase calculando o minHash
for numFrase=1:numFrases
    Frase = cellArrayFrases{1,numFrase}; % Recupera a frase atual

    % Itera sobre cada função de hash
    for numHashFunc=1:numHashFuncs
        % Armazena os hashes para cada shingle
        hashArray = zeros(1,strlength(Frase)-shingleSize+1);
        % Itera sobre cada shingle na frase e calcula valores de hash
        for numShingle=1:strlength(Frase)-shingleSize+1
            % Extrai o shingle da frase
            key = char(Frase(numShingle:(numShingle+shingleSize-1)));
            % Calcula o hash e armazena no array
            hashArray(numShingle) = hf1(key,numHashFunc)+1;
        end
        % Armazena o menor hash para cada função de hash
        MinHashFrases(numFrase,numHashFunc) = min(hashArray);
    end
end

% Inicializa a matriz de distância
Distance = zeros(4,4);

% Calcula a distância entre as assinaturas de MinHash das frases
for n1=1:length(MinHashFrases)
    for n2=n1:length(MinHashFrases)
        % Verifique quantos valores de hash correspondem entre as duas frases
        isMatch = MinHashFrases(n1,:)==MinHashFrases(n2,:);
        % Calcule e armazene a distância Jaccard
        Distance(n1,n2) = 1-sum(isMatch)/length(isMatch);
    end
end

%% Versão 2
clear all;

% Frases fornecidas
frases = {'Gosto muito de teatro e cinema.', ...
          'O teatro é mais dificil que o cinema.', ...
          'Há muita gente que não gosta de teatro.', ...
          'O teatro e o cinema são duas formas de cultura.'};

% Gerar shingles para cada frase
k = 3;
shinglesFrases = cell(1, length(frases));
for i = 1:length(frases)
    shinglesFrases{i} = generateShingles(frases{i}, k);
end

% Calcular assinaturas de MinHash para cada frase
numHashFuncs = 4;
minHashSignatures = inf(length(frases), numHashFuncs);
for i = 1:length(frases)
    for shingle = shinglesFrases{i}
        for nhf = 1:numHashFuncs
            hashCode = hf1(char(shingle), nhf);
            minHashSignatures(i, nhf) = min(minHashSignatures(i, nhf), hashCode);
        end
    end
end

% Calcular a similaridade de Jaccard entre todas as frases
similaridades = zeros(length(frases));
for i = 1:length(frases)
    for j = i+1:length(frases)
        interseccao = sum(minHashSignatures(i,:) == minHashSignatures(j,:));
        similaridades(i,j) = interseccao / numHashFuncs;
    end
end

% Encontrar o par mais similar
[valorMax, idxMax] = max(similaridades(:));
[iMax, jMax] = ind2sub(size(similaridades), idxMax);

% Exibir o par mais similar
fprintf('O par mais similar é entre as frases %d e %d com uma similaridade de Jaccard de %.2f.\n', iMax, jMax, valorMax);

function shingles = generateShingles(frase, k)
    n = length(frase);
    shingles = cell(1, n-k+1);
    for i = 1:(n-k+1)
        shingles{i} = frase(i:(i+k-1));
    end
end

