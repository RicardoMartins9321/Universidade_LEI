function movies = getMovies(users,data)
    Nu= length(users); % Número de utilizadores
    % Constroi a lista de filmes para cada utilizador
    movies= cell(Nu,1); % Usa células
    
    for n = 1:Nu % Para cada utilizador
        % Obtem os filmes de cada um
        ind = find(data(:,1) == users(n));
        % E guarda num array. Usa celulas porque utilizador tem um numero
        % diferente de filmes. Se fossem iguais podia ser um array
        movies{n} = [movies{n} data(ind,2)];
    end
end

   

