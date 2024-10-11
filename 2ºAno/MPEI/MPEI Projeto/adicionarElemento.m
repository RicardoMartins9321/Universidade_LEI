function filter = adicionarElemento(filter, key, numHashFunc)
    for i= 1:numHashFunc
        % coloca a chave igual à concatenação da chave com o indice
        key = [key num2str(i)];
        
        % usa uma função hash para codificar a chave concatenada
        code = mod(string2hash(key), length(filter)) + 1;
        
        % Incrementa a contagem no índice 'code' do filtro Bloom.
        filter(code) = filter(code)+1;
    end
end


