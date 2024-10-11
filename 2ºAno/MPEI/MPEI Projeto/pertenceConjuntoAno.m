function resultado = pertenceConjuntoAno(filter,genre, year,numHashFunc)
    res_lst = zeros(numHashFunc,1); % inicializa um vetor para guardar os resultados

    for i = 1:numHashFunc
        % coloca a chave igual à concatenação do genero, com o ano, com o indice 
        key = [genre num2str(year) num2str(i)];

        % usa uma função hash para codificar a chave concatenada
        code = mod(string2hash(key),length(filter))+1;

        res_lst(i) = filter(code); % Store the result in its corresponding index
    end

    % verifca se a soma de todos os resultados é igual ao numero de funções hash.
    resultado = min(res_lst);
end
