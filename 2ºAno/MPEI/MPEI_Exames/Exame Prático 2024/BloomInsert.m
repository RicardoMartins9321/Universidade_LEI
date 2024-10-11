function [BloomFilter] = BloomInsert(BloomFilter, element, numHashFunctions)
    % BloomInsert insere um elemento no filtro de Bloom.
    % BloomFilter: o filtro de Bloom.
    % element: o elemento a ser inserido.
    % numHashFunctions: número de funções hash utilizadas no filtro.
    
    filterLength = length(BloomFilter);
    
    for idx = 1:numHashFunctions
        element = [element int2str(idx)];
        index = mod(string2hash(element), filterLength)+1;         
        BloomFilter(index) = 1; % Define o bit correspondente.
    end
end
