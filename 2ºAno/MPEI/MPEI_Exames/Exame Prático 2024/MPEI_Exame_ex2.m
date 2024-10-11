clear all;
load file.mat
%%
% a) Inicialização do Filtro de Bloom
total = 0;
for i = 1:length(persons)
    if persons{i} == "André"
        total = total + 1;
    end
end
fprintf("Total: %f\n", total)
%
m = 600; % Tamanho do filtro de Bloom
filtro = zeros(m, 1); % Inicializando o filtro com zeros
chaves = persons(1:500);

%%
for i = 1:600
    chave = char(persons{i});
    code = mod(string2hash(chave), m) + 1;
    filtro(code) = 1;
end

total2 = 0;
for i = 1:length(filtro)
    if filtro{i} == "André"
        total2 = total2 + 1;
    end
end