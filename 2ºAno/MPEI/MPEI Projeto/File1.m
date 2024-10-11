clear all;
clc;

% Inicializações
% 1

movies = readcell('movies.csv', 'Delimiter', ',');
titles = movies(:,1);
numTitles = length(titles);
years = movies(:,2);
uniqueYears = cellfun(@safeStr2Num, movies(:, 2), 'UniformOutput', true);
uniqueYears = unique(uniqueYears);
numYears = height(uniqueYears);

genres = getGenres(movies);
uniqueGenres = unique(genres);
uniqueGenres = setdiff(uniqueGenres, {'(no genres listed)'});
numGenres = length(uniqueGenres);

% 2 and 3
filterSize = 1000;
numHashFuncGenre = round(filterSize * log(2) / numGenres);   % valor otimo de k teorico
numHashFuncGenreYear = round(filterSize * log(2) / (numGenres+numYears));   % valor otimo de k teorico
fprintf("Initializing Bloom filters....")
genreFilter = inicializarFiltro(filterSize);
genreYearFilter = inicializarFiltro(filterSize);
fprintf("Done\n")

fprintf("Populating bloom filters....")
% Bloom filter for genres
for i = 1:length(genres)
    genreFilter = adicionarElemento(genreFilter, genres{i}, numHashFuncGenre);
end
% Populate Bloom filter for genre-year combination
for i = 1:height(movies)
    if ~isempty(genres{i}) && ~isempty(years{i})
        genreYearFilter = adicionarElementoAno(genreYearFilter, genres{i}, years{i}, numHashFuncGenreYear);
    end
end
fprintf("Done\n")

% 4
numHash = 20;
shingleSize = 2; 
matrizMinHashTitles = minHashTitles(titles,numHash,shingleSize);
distancesTitles = getDistancesByTitles(numTitles,matrizMinHashTitles,numHash);

fprintf("Saving Variables....")
save('myVariables.mat', 'movies', 'titles', 'numTitles', 'years', 'uniqueYears', 'numYears', 'genres', 'uniqueGenres', ...
    'numGenres', 'filterSize', 'genreFilter', 'genreYearFilter', 'numHashFuncGenre', 'numHashFuncGenreYear', ...
    'shingleSize', 'numHash');
fprintf("Done\n")

%5 
%{fprintf("Creating Matrix and aplying minHash for the genres....")
%matrizAssGenres = matrizAss(movies,genres);
%matrizMinHashGenres = minHash(matrizAssGenres,numHash);
%distancesGenres = getDistancesMinHashGenres(numFilms,matrizMinHashGenres,numHash);
%fprintf("Done\n")

function genres = getGenres(movies)
    genres = {};
    k = 1;

    for i= 1:height(movies)
        for j= 3:12
            if ~anymissing(movies{i,j}) && ~strcmp(movies{i,j},'unknown')
                genres{k} = movies{i,j};
                k = k+1;
            end
        end
    end

end

function num = safeStr2Num(input)
    if ischar(input) || isstring(input)
        num = str2double(input); % Convert string to number
    elseif isnumeric(input)
        num = input; % Already a number
    else
        num = NaN; % Not a number or string, return NaN
    end
end

function matrizMinHashTitles = minHashTitles(titles,numHash,shingleSize)
    numTitles = length(titles);
    matrizMinHashTitles = inf(numTitles, numHash);
    
    b = waitbar(0,'Calculating minHashTitles()...');
    for i= 1 : numTitles
        movie = titles{i};
        waitbar(i/numTitles,b);
        for j = 1 : (length(movie) - shingleSize + 1)
            h = zeros(1, numHash);
            shingle = lower(char(movie(j:(j+shingleSize-1)))); 
            for nHash = 1 : numHash
                shingle = [shingle num2str(nHash)];
                h(nHash) = DJB31MA(shingle, 127);
            end
            matrizMinHashTitles(i, :) = min([matrizMinHashTitles(i, :); h]);
        end
    end
    delete(b);
end

function distances = getDistancesByTitles(numTitles,matriz,numHash) 
    distances = zeros(numTitles,numTitles);
    for n1= 1:numTitles
        for n2= n1+1:numTitles
            distances(n1,n2) = sum(matriz(n1,:)==matriz(n2,:))/numHash;
        end
    end
end

function matrizAss = matrizAss(movies, genres)
    numFilms = height(movies);
    numGenres = length(genres);
    
    % Preparing indices for sparse matrix creation
    rows = [];
    cols = [];
    
    for i = 1:numGenres
        for n = 1:numFilms
            for k = 2:7
                if ~anymissing(movies{n,k}) && strcmp(genres(i), movies{n,k})
                    rows = [rows; i];
                    cols = [cols; n];
                end
            end
        end
    end
    
    % Create sparse matrix
    matrizAss = sparse(rows, cols, 1, numGenres, numFilms);
end


function matrizMinHashGenres = minHash(matrizAss,numHashFunc)
    p = primes(10000);
    matrizMinHashGenres = zeros(numHashFunc,width(matrizAss));
    kList = p(randperm(length(p),numHashFunc));

    for func= 1:length(kList)
        for d= 1:width(matrizAss)
            matrizMinHashGenres(func,d) = min(mod(find(matrizAss(:,d)==1),kList(func)));
        end
    end

end

function distances = getDistancesMinHashGenres(numFilms,matrizMinHash,numHash) 
    distances = zeros(numFilms,numFilms);
    for n1= 1:numFilms
        for n2= n1+1:numFilms
            distances(n1,n2) = sum(matrizMinHash(:,n1)==matrizMinHash(:,n2))/numHash;
        end
    end
end
