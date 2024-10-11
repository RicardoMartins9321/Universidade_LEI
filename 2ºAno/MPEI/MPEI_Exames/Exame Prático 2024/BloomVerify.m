function [result] = BloomVerify(BloomFilter, element, numHashFunctions)
    % BloomVerify verifica a presença de um elemento no filtro de Bloom.
    % BloomFilter: o filtro de Bloom.
    % element: o elemento a ser verificado.
    % numHashFunctions: número de funções hash utilizadas no filtro.
    
    result = 1; % Assume inicialmente que o elemento está presente.
    filterLength = length(BloomFilter);
   
    for idx = 1:numHashFunctions
        element = [element int2str(idx)];
        index = mod(string2hash(elemment), filterLength)+1;  
        if BloomFilter(index) ~= 1
            result = 0; % Se algum bit não estiver a 1, o elemento não está presente.
        end
    end
end

