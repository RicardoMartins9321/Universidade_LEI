%% Ex 2.2.9 a)
media = 14;
desvio = 2;
N = 1e5;    % número de simulações
limiteInferior = 12;
limiteSuperior = 16;

X = randn(1,N);
% Y array = random number x * o desvio + o valor da media, como o valor
% random pode ser negativo ou positivo, ao multiplicarmos primeiro pelo
% desvio já vamos obter desvio para o lado positivo e negativo
Y = X * desvio + media;
histogram(Y);

notas_12a16 = sum(Y>12 & Y<16);
probSim_12a16 = notas_12a16/N

probTeo_12a16 = normcdf(limiteSuperior, media, desvio) - normcdf(limiteInferior, media, desvio)

%% Ex 2.2.9 b)
media = 14;
desvio = 2;
N = 1e5;    % número de simulações
limiteInferior = 10;
limiteSuperior = 18;

X2 = randn(1,N);
% Y array = random number x * o desvio + o valor da media, como o valor
% random pode ser negativo ou positivo, ao multiplicarmos primeiro pelo
% desvio já vamos obter desvio para o lado positivo e negativo
Y2 = X2 * desvio + media;
histogram(Y2);

notas_10a18 = sum(Y2>10 & Y2<18);
probSim_10a18 = notas_10a18/N

probTeo_10a18 = normcdf(limiteSuperior, media, desvio) - normcdf(limiteInferior, media, desvio)

%% Ex 2.2.9 c)
media = 14;
desvio = 2;
N = 1e5;    % número de simulações
limiteInferior = 10;
limiteSuperior = 20;

X3 = randn(1,N);
% Y array = random number x * o desvio + o valor da media, como o valor
% random pode ser negativo ou positivo, ao multiplicarmos primeiro pelo
% desvio já vamos obter desvio para o lado positivo e negativo
Y3 = X3 * desvio + media;
histogram(Y3);

notas_10acima = sum(Y3>=10);
probSim_10acima = notas_10acima/N

probTeo_10acima = normcdf(limiteSuperior, media, desvio) - normcdf(limiteInferior, media, desvio)
