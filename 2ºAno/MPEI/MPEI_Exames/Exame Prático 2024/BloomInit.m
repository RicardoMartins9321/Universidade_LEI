function [BloomFilter] = BloomInit(filterSize, numHashFunctions)
    % BloomInit inicializa um filtro de Bloom.
    % filterSize: o tamanho do filtro de Bloom.
    % numHashFunctions: número de funções hash utilizadas no filtro.
    
    % Cria um vetor de zeros do tamanho especificado.
    BloomFilter = zeros(1, filterSize);
end
