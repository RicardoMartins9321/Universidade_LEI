clear;
% 1.
ficheiro=fopen("wordlist-preao-20201103.txt");
palavras=textscan(ficheiro,"%s",'delimiter','\n');
palavras=palavras{1};
fclose(ficheiro);

n=8000; % número de filtros de bloom
k=3;
chaves=palavras(1:1000);

filtro=inicializarFiltro(n);

for i=1:length(chaves)
    filtro=adicionarElemento(filtro,chaves{i},k);
end

% 2.
falso_negativos = 0;

% falsos negativos são elementos que pertencem ao conjunto mas apesar
% disso o resultado da função pertença retorna que estes não pertencem ao
% conjunto, apesar de isso estar errado.
for i= 1:length(chaves)
    if ~pertenceConjunto(filtro,chaves{i},k)
        falso_negativos = falso_negativos+1;
    end
end

fprintf("Número de falsos negativos: %d\n", falso_negativos);

% 3.
chaves2=palavras(1001:11000);
falsos_positivos = 0;

% falsos positivos são elementos que não pertencem ao conjunto mas apesar
% disso o resultado da função pertença retorna que sim apesar de estar
% errado.
for i= 1:length(chaves2)
    if pertenceConjunto(filtro,chaves2{i},k)
        falsos_positivos = falsos_positivos+1;
    end
end

fprintf("Número de falsos positivos: %d\n", falsos_positivos);
fprintf("Prob experimental de falsos positivos me percentagem: %.3f\n", falsos_positivos/(length(chaves2)) * 100);

% 4.
valor_teorico = (1 - exp((-k * length(chaves)) / n))^k;
fprintf("Probabilidade teórica de falsos positivos em percentagem: %.3f\n", valor_teorico*100);

%% 5.
clear;
ficheiro=fopen("wordlist-preao-20201103.txt");
palavras=textscan(ficheiro,"%s",'delimiter','\n');
palavras=palavras{1};
fclose(ficheiro);

n=8000;
k_values=4:10;
lista_falsos_positivos_sim = zeros(7,1);
lista_falsos_positivos_teo = zeros(7,1);

filtro=inicializarFiltro(n);

for k= k_values
    chaves = palavras(1:1000);
    filtro = inicializarFiltro(n);

    for i= 1:length(chaves)
        filtro = adicionarElemento(filtro,chaves{i},k);
    end

    chaves2 = palavras(1001:11000);
    falsos_positivos = 0;

    for i= 1:length(chaves2)
        if pertenceConjunto(filtro,chaves2{i},k)
            falsos_positivos = falsos_positivos+1;
        end
    end
    
    % k começa em 4 logo temos de subtrair 3 para estar no indice correto para a lista 
    lista_falsos_positivos_sim(k-3) = falsos_positivos/length(chaves2)*100;
    lista_falsos_positivos_teo(k-3) = ((1 - exp((-k * length(chaves)) / n))^k) * 100;
end

hold on
legend
plot(k_values, lista_falsos_positivos_sim, "-*", "DisplayName", "Gráfico Simulação");
plot(k_values, lista_falsos_positivos_teo, "-*", "DisplayName", "Gráfico Teórico");
xlabel("Número de funções de dispersão k");
ylabel("Prob(%) de falsos positivos");
grid;
hold off;

fprintf("Valor de k ótimo teorico arredondado: %0.f\n", (n*log(2))/length(chaves))
