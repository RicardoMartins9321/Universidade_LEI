function keys = dispersao(N, imin, imax, characters, probabilities)
    keys = cell(N, 1);
    
    if nargin < 5
        probabilities = ones(size(characters)) / numel(characters);  % Equal probabilities
    end
    
    for i = 1:N
        keyLength = randi([imin, imax]);
        keyIndices = randsample(1:numel(characters), keyLength, true, probabilities);
        keys{i} = characters(keyIndices);
    end
end