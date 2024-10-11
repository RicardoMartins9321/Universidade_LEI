%% Ex 3.1.1. a)

% Linha/coluna 1 - não faltar
% Linha/coluna 2 - faltar
T = [0.7,0.8 ; 0.3,0.2];

disp(T*T)

X_naofaltar = [1 ; 0];    % estados porque nao faltou
T2 = T^2;

res_matriz = (T2*X_naofaltar);
probA = res_matriz(1)

%% Ex 3.1.1. b)
% Linha/coluna 1 - não faltar
% Linha/coluna 2 - faltar
T = [0.7,0.8 ; 0.3,0.2];

X_faltar = [0 ; 1];    % estados porque faltou
T2 = T^2;

res_matriz = (T2*X_faltar);
probB = res_matriz(1)

%% Ex 3.1.1. c)
T = [0.7,0.8 ; 0.3,0.2];

X_naofaltar2 = [1 ; 0];    % estados porque faltou
T15 = T^15;

res_matriz = (T15*X_naofaltar2);
probC = res_matriz(1)

%% Ex 3.1.1. d)
T = [0.7 0.8 ; 0.3 0.2];

probD = zeros(1,30);
  
X_faltar = [0.15 ; 0.85]; 
  
for aula = 1 : 30
    matriz = T^(aula-1) * X_faltar;
    probD(aula) = matriz(1);
end
  
plot(1:30,probD, Marker="*");
xlabel("Aulas");
ylabel("Probabilidade de faltar");
