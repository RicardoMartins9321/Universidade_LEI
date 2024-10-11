%% Ex 2
% a)
load('L.mat')

% Sendo L uma matriz 120x120
disp("O valor de N é:")
N = size(L)
S=sum(L);
disp("Os dead-dens são:")
find(S==0)

% b)
H=zeros(N(1),N(1));
n=0;
for i=1:120
    n=sum(L(:,i));
    H(:,i)=L(:,i)/n;
end

disp("A matriz H é:");
H

% c) 
disp("A matriz A é:")
b=0.85;
A=b*H+(1-b)*(ones(N(1),N(1))/N(1))

% d)

pageRankE = (ones(N(1),1)/N(1));
iteracoes = 1;
valor_maximo = 1e-4;

% vai iterando a matriz do pageRank ao longo do tempo até que seja
% encontrado o número de iterações que produz uma matriz pagRank em que nenhum
% valor varia mais do que a variavel valor_maximo
while true
    pageRankE_Old = pageRankE;
    pageRankE = A*pageRankE;
    if max(abs(pageRankE-pageRankE_Old)) < valor_maximo
        break;
    end
    iteracoes = iteracoes +1;
end

fprintf("Número de iterações necessárias: %d\n", iteracoes)

% e
PageRankE(15)
PageRankE(24)
PageRankE(43)
PageRankE(69)