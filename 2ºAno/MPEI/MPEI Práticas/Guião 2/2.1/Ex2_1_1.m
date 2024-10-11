%% Ex2.1.1 a)
N = 1e7;
p = 0.5;
n = 2;
k = 1;

% cria uma tabela familias que contem valores logicos 0 e 1 no qual estamos
% a considerar que se for 1 dá rapaz e se der 0 nasceu rapariga
acontecimentos = rand(n,N)<p;

sucessos = sum(acontecimentos) >= k;
probSimulacao = sum(sucessos)/N

%% Ex2.1.1 b)
casosFavoraveis = 3;
casosPossiveis = 4;
probCalculoB = casosFavoraveis/casosPossiveis

%% Ex2.1.1 c)
% P(A|B)
% A - família tem pelo menos 1 rapaz
% B - família tem 2 rapazes

N = 1e5;
n = 2;
p = 0.5;
% cria uma tabela familias que contem valores logicos 0 e 1 no qual estamos
% a considerar que se for 1 dá rapaz e se der 0 nasceu rapariga
familia = rand(n,N) < p;                
A = sum(familia)>=1;
B = sum(familia)==2;
probSimulacaoC = sum(B)/sum(A)

casosFavoraveis = 1;
casosPossiveis = 3;
probCalculoC = casosFavoraveis/casosPossiveis
%% Ex2.1.1 d)
N = 1e5;
n = 2;
p = 0.5;

% cria uma tabela familias que contem valores logicos 0 e 1 no qual estamos
% a considerar que se for 1 dá rapaz e se der 0 nasceu rapariga
familias = rand(n,N) < p;

% familia tem 2 rapazes se a soma da coluna der igual a 2
A = sum(familias)==2;   

% primeiro filho rapaz, por isso só nos interessa ver se na primeira linha da 
% tabela porque os casos possiveis foram reduzidos a metade, visto que
% agora o segundo filho so tem duas opçoes, ou é rapaz ou é rapariga
B = familias(1,:);      
probSimulacaoD = sum(A)/sum(B)

casosFavoraveis = 1;
casosPossiveis = 2;
probCalculoD = casosFavoraveis/casosPossiveis
%% Ex2.1.1 e)
N = 1e5;
n = 5;
p = 0.5;

familia = rand(n,N) < p; 

casosFavoraveisE = sum(familia)==2; % caso a soma dos 5 elementos da coluna(filhos) de 
% igual a 2(2rapazes e 3 raparigas)

casosPossiveisE = sum(familia) >= 1;
probSimulacaoE = sum(casosFavoraveisE)/sum(casosPossiveisE)

%% Ex2.1.1 f)
N = 1e5;
n = 5;
p = 0.5;

familia = rand(n,N) < p; 

% a soma de rapazes vai ser no minimo 2 logo a soma das colunas vai dar >=2 
casosFavoraveisF = sum(familia)>=2; 

casosPossiveisF = sum(familia) >= 1;
probSimulacaoF = sum(casosFavoraveisF)/sum(casosPossiveisF)
