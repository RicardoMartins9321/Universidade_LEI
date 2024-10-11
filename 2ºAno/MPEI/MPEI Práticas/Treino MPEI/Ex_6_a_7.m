%% Ex 1.6
% a)
%    1      2   3   4   5
T = [0.8    0   0   0.3 0 ; % 1
     0.2    0.6 0   0.2 0 ; % 2
     0      0.3 1   0   0 ; % 3
     0      0.1 0   0.4 0 ; % 4
     0      0   0   0.1 1 ];% 5

% b)
estados = zeros(1,100);
x0 = [1 ; 0 ; 0 ; 0 ; 0];

for i = 1:100
    prob = T^(i-1)*x0;
    estados(i) = prob(2);
end

plot(estados);
grid;

% c)
estado3 = zeros(1,100);
estado5 = zeros(1,100);

for i = 1:100
    prob = T^i*x0;
    estado3(i) = prob(3);
    estado5(i) = prob(5);
end

plot(estado3)
hold on
plot(estado5)
legend("estado 3", "estado 5");
grid;

% d)
%    1      2       4       3   5     
M = [0.8    0       0.3     0   0 ; % 1
     0.2    0.6     0.2     0   0 ; % 2
     0      0.1     0.4     0   0 ; % 4
     0      0.3     0       1   0 ; % 3
     0      0       0.1     0   1]; % 5

Q = M(1:3,1:3)

% e)
F = inv(eye(length(Q))-Q)

% f)
E = sum(F);
fprintf("Nº passos a começar em 1: %f\n", E(1));
fprintf("Nº passos a começar em 2: %f\n", E(2));
fprintf("Nº passos a começar em 4: %f\n", E(3));

% g)
R = M(4:5, 1:3);
B = R*F

fprintf("Começando no estado 1, prob. absorção do estado 3: %f\n", B(1,1));
fprintf("Começando no estado 1, prob. absorção do estado 5: %f\n", B(2,1));


%% Ex 1.7
% a)
%    A  B   C   D   E   F
H = [0  0   0   0   1/3 0 ;  % A
     1  0   0   0   1/3 0 ;  % B
     0  1/2 0   1   0   0 ;  % C
     0  0   1   0   0   0 ;  % D
     0  1/2 0   0   0   0 ;  % E
     0  0   0   0   1/3 0];  % F

pageRankA = (ones(1,6)/6)';

for i = 1:10
    pageRankA = H * pageRankA;
end

disp("PageRank ao final de 10 iterações:")
disp(pageRankA)

% b)
disp("Spider Trap é o estado C e D")
disp("Dead end é o estado F")

% c)
%    A  B   C   D   E   F
H = [0  0   0   0   1/3 1/6 ;  % A
     1  0   0   0   1/3 1/6 ;  % B
     0  1/2 0   1   0   1/6 ;  % C
     0  0   1   0   0   1/6 ;  % D
     0  1/2 0   0   0   1/6 ;  % E
     0  0   0   0   1/3 1/6];  % F

pageRankC = (ones(1,6)/6)';

for i = 1:10
    pageRankC = H * pageRankC;
end

disp("PageRank ao final de 10 iterações:")
disp(pageRankC)

% d)
% já se usa o H modificado porque normal o F só tem 0, caso tivesse uma
% ligação para ele próprio acho que já dava para usar a matriz original
%    A  B   C   D   E   F
H = [0  0   0   0   1/3 1/6 ;  % A
     1  0   0   0   1/3 1/6 ;  % B
     0  1/2 0   1   0   1/6 ;  % C
     0  0   1   0   0   1/6 ;  % D
     0  1/2 0   0   0   1/6 ;  % E
     0  0   0   0   1/3 1/6];  % F

pageRankD = (ones(1,6)/6)';
beta = 0.8;
A = beta*H + (1-beta)*ones(length(H),length(H))/length(H);

for i = 1:10
    pageRankD = A * pageRankD
end

disp("PageRankD ao final de 10 iterações:")
disp(sum(pageRankD))

% e)
pageRankE = (ones(1,6)/6)';
iteracoes = 1;
valor_maximo = 10e-5;

while true
    pageRankE_old = pageRankE;
    pageRankE = A * pageRankE;
    if max(abs(pageRankE-pageRankE_old)) < valor_maximo
        fprintf("São necessárias %d iterações para variar menos que 10^(-4)\n", iteracoes)
        break
    end
    iteracoes = iteracoes+1;
end
