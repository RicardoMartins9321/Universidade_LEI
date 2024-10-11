%% Ex 3.1.6 a)
% Matriz 5x5
T = [0.8 0 0 0.3 0 ; 
    0.2 0.6 0 0.2 0 ; 
    0 0.3 1 0 0 ; 
    0 0.1 0 0.4 0 ; 
    0 0 0 0.1 1 ]

%% Ex 3.1.6 b)
% Matriz 5x5
T = [0.8 0 0 0.3 0 ;    
    0.2 0.6 0 0.2 0 ; 
    0 0.3 1 0 0 ; 
    0 0.1 0 0.4 0 ; 
    0 0 0 0.1 1 ]

X = [1; 0; 0; 0; 0];
estado2 = zeros(1,100);

for i = 1:100
    prob = T^i*X;
    estado2(i) = prob(2);
end

plot(estado2)
grid;
%% Ex 3.1.6 c)
% Matriz 5x5
T = [0.8 0 0 0.3 0 ; 
    0.2 0.6 0 0.2 0 ; 
    0 0.3 1 0 0 ; 
    0 0.1 0 0.4 0 ; 
    0 0 0 0.1 1 ]

X = [1; 0; 0; 0; 0];
estado3 = zeros(1,100);
estado5 = zeros(1,100);

for i = 1:100
    prob = T^i*X;
    estado3(i) = prob(3);
    estado5(i) = prob(5);
end

plot(estado3)
hold on
plot(estado5)
legend("estado 3", "estado 5");
grid;

%% Ex 3.1.6 d)
% Matriz 5x5 modificada
T = [0.8 0 0 0.3 0 ;  % 1  
    0.2 0.6 0 0.2 0 ; % 2
    0 0.3 1 0 0 ;     % 3
    0 0.1 0 0.4 0 ;   % 4
    0 0 0 0.1 1 ]     % 5

M = [0.8 0 0.3 0 0 ;  % 1
    0.2 0.6 0.2 0 0 ; % 2
    0 0.1 0.4 0 0 ;   % 4
    0 0.3 0 1 0 ;     % 3
    0 0 0.1 0 1];     % 5

Q = M(1:3,1:3)

%% Ex 3.1.6 e)
M = [0.8 0 0.3 0 0 ;  % 1
    0.2 0.6 0.2 0 0 ; % 2
    0 0.1 0.4 0 0 ;   % 4
    0 0.3 0 1 0 ;     % 3
    0 0 0.1 0 1];     % 5
% Q é a matriz dos estados transientes
Q = M(1:3,1:3);
% F representa o número médio de visitas a cada estado antes da absorção
% eye é a função identity que pega no length(Q) para poder ter o mesmo
% criar uma matriz identidade ocm o mesmo tamanho de Q e por isso possam
% subtrai um do outro, depois engloba-se tudo em -1 que é a funçao inv do
% MatLab
F = inv(eye(length(Q))-Q)

%% Ex 3.1.6 f)
M = [0.8 0 0.3 0 0 ;  % 1
    0.2 0.6 0.2 0 0 ; % 2
    0 0.1 0.4 0 0 ;   % 4
    0 0.3 0 1 0 ;     % 3
    0 0 0.1 0 1];     % 5

Q = M(1:3,1:3);
% F representa o número médio de visitas a cada estado antes da absorção
F = inv(eye(length(Q))-Q);

E = sum(F);
fprintf("Nº passos a começar em 1: %f\n", E(1));
fprintf("Nº passos a começar em 2: %f\n", E(2));
fprintf("Nº passos a começar em 4: %f\n", E(3));

%% Ex 3.1.6 g)
M = [0.8 0 0.3 0 0 ;  % 1
    0.2 0.6 0.2 0 0 ; % 2
    0 0.1 0.4 0 0 ;   % 4
    0 0.3 0 1 0 ;     % 3
    0 0 0.1 0 1];     % 5

Q = M(1:3,1:3);
% F representa o número médio de visitas a cada estado antes da absorção
F = inv(eye(length(Q))-Q);
R = M(4:5, 1:3);
B = R*F

fprintf("Começando no estado 1, prob. absorção do estado 3: %f\n", B(1,1));
fprintf("Começando no estado 1, prob. absorção do estado 5: %f\n", B(2,1));