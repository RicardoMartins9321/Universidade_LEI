%% Ex2.1.3 a)
N = 1e5;    % número de simulações
T = 1000;   % tamanho do array
k = 10;     % númeoro de chaves por simulação

contadorA  = 0;

for i =1: N
    lugares = randi(T,1,k); 
    if length(lugares) ~= length(unique(lugares)) 
        contadorA = contadorA + 1;
    end 
end

probA = contadorA/N

%% Ex2.1.3 b)
k = 10:10:100; 
T = 1000; 
N = 1e5; 
probB = zeros(length(k));

for i=1 : length(k)
    lugares = randi(T,k(i),N);
    cf = 0;
    for j= 1: N
        if  length(lugares(:,j)) ~= length(unique(lugares(:,j))) 
            cf = cf + 1;
        end
    end
    probB(i) = cf/N;
end 

ylabel("Probabilidade");
xlabel("Keys val");
plot(k, probB);

%% Ex2.1.3 c)
k = 50; 
T = 100:100:1000; 
N = 1e5;
probC = zeros(length(T));

for i = 1:length(T)
    contadorC = 0;
    for j = 1: N
        lugares = randi(T(i), 1, k);
        if length(lugares) == length(unique(lugares)) 
            contadorC = contadorC + 1;
        end 
    end
    probC(i) = contadorC/N;
end

plot(T, probC);
