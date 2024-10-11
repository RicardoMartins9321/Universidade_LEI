function filter = adicionarElemento(filter,key,numHashFunc)
    for i= 1:numHashFunc
        % coloca a chave igual à concatenação da chave com o indice
        key = [key num2str(i)];
        
        % usa uma função hash para codificar a chave concatenada
        code = mod(string2hash(key), length(filter)) + 1;
        
        % Define como true o valor que está no índice do código na matriz de filtros
        filter(code) = true;
    end
end