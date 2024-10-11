%% Ex 1.1 
%  a)
% nFaltar   Faltar
T = [0.7    0.8 ;   % nFaltar
    0.3     0.2];   % Faltar

x0 = [1;0];

T3_nFaltar = T^2*x0
% T3_v2 = T^3 este nao pode ser porque começamos na situação nao faltar por
% isso é preciso levar isso em consideração
T3_v3 = 0.7*0.7 + 0.3*0.8

% b)
x1 = [0;1];
T3_nFaltar2 = T^2*x1;
fprintf("Prob de estar presente na aula 3: %f\n", T3_nFaltar2(1,1))

%c)
x2 = [1;0];
T15_nFaltar = T^14*x2;
fprintf("Prob de estar presente na aula 15: %f\n", T15_nFaltar(1,1))

%d)
x3 = [0.15; 0.85];
probD = zeros(1,30);

for i = 1:30
    T_faltar = T^(i-1) * x3;
    fprintf("Prob de faltar à aula %d: %f \n", i,T_faltar(1))
    probD(i) = T_faltar(1);
end

plot(1:30,probD, Marker="*");
xlabel("Aulas");
ylabel("Probabilidade de faltar");

%% Ex 1.2
% a)
T = [1/3   1/4    0 ;   % A
     1/3   1/2    1/2 ; % B
     1/3   1/4    1/2]; % C

if sum(T)==1
    disp("Trata-se de uma matriz estocástica pois a soma das coluna é igual 1")
end

% b)
nAlunos = 90;
nA = 60;
nB = 15;
nC = 15;

vetor_estados = [nA/nAlunos ; nB/nAlunos ; nC/nAlunos]

% c)
vetor_final = T^(29) * vetor_estados;

nAlunos_30 = vetor_final*nAlunos

% d)
vetor_final_v2 = T^(29) * [30/90 ; 30/90 ; 30/90];

nAlunos_30v2 = vetor_final_v2*nAlunos


%% Ex 1.3 
T = zeros(20,20);

for k = 1 : 20
  % gerar uma matriz de 20x1 de random numbers
  r = rand(20, 1);
  % ao dividir todos os valores de r pelo valor da sua soma garantimos que
  % agora a soma dos valores de r vão igualar a 1
  r = r / sum(r);
  
  T(:,k) = r;
end 

disp(T);
disp("É estocástica pois não temos entradas negativas e a soma de cada coluna dá sempre 1");

% b)
x0 = zeros(1,20)';
x0(1) = 1;

for i = 1:101
    X_prox = T^(i-1)*x0;
    prob_percentagem = X_prox(20)*100;
    if (i==3 || i==6 || i==11 || i==101)
        fprintf('Probabilidade após %d transições: %.5f%%\n', i-1,prob_percentagem);
    end
end
