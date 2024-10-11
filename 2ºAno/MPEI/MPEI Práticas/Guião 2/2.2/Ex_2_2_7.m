%% Ex 2.2.7 a)
lambda = 15;
k = 0;
pka = ((lambda^k)/factorial(k))*exp(-lambda)

%% Ex 2.2.7 b)
lambda = 15;
soma = 0;

for k=0:10 
    pkb = ((lambda^k)/factorial(k))*exp(-lambda);
    soma = pkb + soma;
end

resultado = 1 - soma