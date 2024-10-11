%carregar o arquivo 'u.data' numa matriz u
fich=load("u.data");
u= fich(1:end,1:2);     %que contem todas as linhas da primeira matriz mas so as duas primeiras colunas (que sao as que interessam - no enunciado)
clear fich;     %limpar a variavel temporaria 'fich'

users = unique(u(:,1));
%basicamente baralha todos os indices dos usuarios (ou criar uma amostra aleatoria de 100 users
%a partir de um conjunto de dados originais) e seleciona os primeiro 100 users depois do reorganizaçao
users = users(randperm(length(users),100)); %randperm - 'random permutation' 
%                                                    - para criar uma permutação aleatoria de um
%                                                                          vetor
%                                                    - neste caso a funçao 'randperm' esta a ser
%                                                    usada para embaralhar aleatoriamente os
%                                                    elementos do vetor 'users'

%medir o tempo de execução da função getMovies
tic;        %inicializa um temporizador
movies = getMovies(users,u);
fprintf("getMovies(): %7.6es\n",toc);

%medir o tempo de execução da função getDistances 
tic;
distancias = getDistances(users,movies);
fprintf("getDistances(): %7.6es\n",toc);

%medir o tempo de execução da função filterSimilar
tic;
SimilarUsers = filterSimilar(users,distancias,0.4);     %funçao/criterio que verifica a similaridade 
fprintf("filterSimimlar(): %7.6es\n",toc);

% Imprimir o número de pares de usuários similares e iterar sobre eles
fprintf("Similar users (%d pairs):\n",height(SimilarUsers));
for n= 1:height(SimilarUsers)
    u1 = SimilarUsers(n,1);
    u2 = SimilarUsers(n,2);
    d = distancias(users==u1,users==u2);
    fprintf("Pair (%03d;%03d): %f\n",u1,u2,d);
end