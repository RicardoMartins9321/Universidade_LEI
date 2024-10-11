function resultado = pertenceConjunto(filter,key,numHashFunc)
    res_lst = zeros(numHashFunc,1); % inicializa um vetor para guardar os resultados

    for i = 1:numHashFunc
        % coloca a chave igual à concatenação da chave com o indice 
        key = [key num2str(i)];

        % usa uma função hash para codificar a chave concatenada
        code = mod(string2hash(key),length(filter))+1;

        res_lst(i) = filter(code); % guarda o resultado no seu indice correspondente
    end

    % verifca se a soma de todos os resultados é igual ao numero de funções hash.
    resultado = all(res_lst);
end
