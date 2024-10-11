%% Versão - Correta
clear all;

% a) Inicialização do Filtro de Bloom

m = round(-300/log(0.97)); % Tamanho do filtro de Bloom
filtro = zeros(m, 1); % Inicializando o filtro com zeros
chars = 'abcdefghijklmnopqrstuvwxyz'; % Caracteres possíveis

% b) Geração de 4000 Palavras Aleatórias

palavras = cell(1, 4000);
for i = 1:4000
    if rand() < 0.4
        tamanho = 5; % 40% de chance de ter 5 caracteres
    else
        tamanho = 8; % 60% de chance de ter 8 caracteres
    end
    
    palavra = "";
    for j = 1:tamanho
        palavra = strcat(palavra, chars(randi(length(chars))));
    end
    palavras{i} = palavra;
end

% c) Inserção das Primeiras 300 Palavras no Filtro de Bloom

for i = 1:300
    chave = char(palavras{i});
    code = mod(string2hash(chave), m) + 1;
    filtro(code) = 1;
end

% d) Teste de Falsos Positivos com Palavras de 301 a 4000

falsos_positivos = 0;
for i = 301:4000
    chave = char(palavras{i});
    code = mod(string2hash(chave), m) + 1;
    if filtro(code) == 1
        falsos_positivos = falsos_positivos + 1;
    end
end

fprintf("Percentagem de falsos positivos: %f%%\n", falsos_positivos / (4000 - 300) * 100);


%% Versão 1
clear all;
clc;

% a)
m = 400; % número de palavras
k = 1;

n = round(-400/log(0.98));

fprintf("Tamanho do filtro %d\n", n);

% b)

filtro = zeros(n,1);
chars = 'a':'z';
cellStrings = cell(1,4400);

for i= 1:length(cellStrings)
    sizeR = rand() < 0.4;
    size = 0;
    if sizeR == 1
        size = 6;
    else
        size = 10;
    end
    
    string = "";
    for j= 0:size
        string=strcat(string,chars(floor((length(chars)+1-1)*rand()+1)));
    end
    cellStrings{i} = string;
end

chaves=cellStrings(1:400);

for i= 1:length(chaves)
    chave = char(chaves{i});
    code = mod(string2hash(chave),length(filtro))+1;
    filtro(code) = 1;
end

chaves=cellStrings(401:4400);

falsos_positivos=0;

for i= 1:length(chaves)
    chave = char(chaves{i});
    code = mod(string2hash(chave),length(filtro))+1;
    resultado = filtro(code);
    
    if resultado == 1
        falsos_positivos = falsos_positivos+1;
    end
end

fprintf("Percentagem de falsos positivos %f%%\n",falsos_positivos/length(chaves)*100);

%% Versão 2
clear all

% A)
% 400 palavras (m)
% 1 funçao (k)
% ? tamanho (n)
% pfp = 2% = 0.02

m = 400;
k = 1;
pfp = 0.02;
N = 1;
while true
    pfptest = (1-exp((-k*m)/N))^k;
    if abs(pfp-pfptest) < 0.00001
        break
    end
    N = N+1;
end
fprintf("Tamanho do filtro %d\n", N);


% B)
alfabeto = 'a':'z';
wordArr1 = GenerateString(m,alfabeto);
wordArr2 = GenerateString(4000, alfabeto);
B = BloomInit(N,k);

for i=1:length(wordArr1)
    word = wordArr1{i};
    B = BloomInsert(B,word,k);
end

fp = 0;
for i=1:length(wordArr2)
    word = wordArr2{i};
    if BloomVerify(B,word,k) == 1
        fp = fp +1;
    end
end
fprintf("Número de Falsos Positivos %d\n", fp);
fprintf("Percentagem de falsos positivos %f%%\n",fp/400);

