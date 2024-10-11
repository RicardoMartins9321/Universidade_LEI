%% Ex 3.1.2 a)
% Lina/coluna 1 é o A
T = [1/3,1/4,0 ; 1/3,1/2,1/2 ; 1/3,1/4,1/2]

if (sum(T) == 1)
    disp("Matriz é estocástica porque não tem nenhuma entrada negativa e a soma de cada linha/coluna == 1")
end

%% Ex 3.1.2 b)
A = 60;
B = 15;
C = 15;
total = 90;

X = [A/total;B/total;C/total]

%% Ex 3.1.2 c)
A = 60;
B = 15;
C = 15;
total = 90;

T = [1/3 1/4 0 ; 1/3 11/20 1/2 ; 1/3 1/5 1/2];
X = [A/total ; B/total ; C/total]

x30 = T^30*X;
alunos = total*x30

%% Ex 3.1.2 d)
A = 30;
B = 30;
C = 30;
total = 90;

T = [1/3 1/4 0 ; 1/3 11/20 1/2 ; 1/3 1/5 1/2];
X = [A/total ; B/total ; C/total]

x30 = T^30*X;
alunos2 = total*x30
