%% Ex 3.1.5 a)
T = [0.7, 0.2, 0.3 ; 0.2, 0.3, 0.3 ; 0.1, 0.5, 0.4]

%% Ex 3.1.5 b)
T = [0.7, 0.2, 0.3 ; 0.2, 0.3, 0.3 ; 0.1, 0.5, 0.4];

X = [1 ; 0 ; 0];
T2 = T*T(1,1);
T3 = T*T(1,1);

estado_segundoDia = (T2);
probSol_segundoDia = estado_segundoDia(1)

estado_terceiroDia = (T3);
probSol_terceiroDia = estado_terceiroDia(1)

% Versão 2
Sol1 = 1;
Sol2 = Sol1 * T(1,1);
Sol3 = Sol2 * T(1,1)

%% Ex 3.1.5 c)
T = [0.7, 0.2, 0.3 ; 0.2, 0.3, 0.3 ; 0.1, 0.5, 0.4]

X = [1 ; 0 ; 0];

dia2 = T*X  
% prob de passar de sol para sol ou de sol para nuvens
sol3 = dia2(1)*0.7 + dia2(1)*0.2;
% prob de nuvens passar para nuvens + prob de nuvens passar para sol
nuvem3 = dia2(2)*0.3 + dia2(2)*0.2;

probNaoChuva = sol3+nuvem3  % prob nao chuva será a prob de um caso mais o outro

%% Ex 3.1.5 d)
T = [0.7, 0.2, 0.3 ; 0.2, 0.3, 0.3 ; 0.1, 0.5, 0.4]

X = [1 ; 0 ; 0];

diaSol = 1;
diaNuvens = 0;
diaChuva = 0;

for i = 2:31
    X = T*X;
    diaSol = diaSol + X(1);
    diaNuvens = diaNuvens + X(2);
    diaChuva = diaChuva + X(3);
end

fprintf("Numero médio de dias de sol: %f\n", diaSol);
fprintf("Numero médio de dias de nuvens: %f\n", diaNuvens);
fprintf("Numero nédio de dias de chuva: %f\n", diaChuva);

%% Ex 3.1.5 e)
T = [0.7, 0.2, 0.3 ; 0.2, 0.3, 0.3 ; 0.1, 0.5, 0.4]

X = [0 ; 0 ; 1];

diaSol = 0;
diaNuvens = 0;
diaChuva = 1;

for i = 2:31
    X = T*X;
    diaSol = diaSol + X(1);
    diaNuvens = diaNuvens + X(2);
    diaChuva = diaChuva + X(3);
end

fprintf("Numero médio de dias de sol: %f\n", diaSol);
fprintf("Numero médio de dias de nuvens: %f\n", diaNuvens);
fprintf("Numero nédio de dias de chuva: %f\n", diaChuva);


%% Ex 3.1.5 f)
T = [0.7, 0.2, 0.3 ; 0.2, 0.3, 0.3 ; 0.1, 0.5, 0.4]

sol = [1; 0 ; 0];
DorSol = 0.1;
chuva = [0; 0; 1];
dorChuva = 0.5;

% Média de dias quando começa com sol
for i = 2:31
    sol = T*sol;
    DorSol = DorSol + 0.1*sol(1) + 0.3*sol(2) + 0.5*sol(3);
end

% Média de dias quando começa com chuva
for j = 2:31
    chuva = T*chuva;
    dorChuva = dorChuva + 0.1*chuva(1) + 0.3*chuva(2) + 0.5*chuva(3);
end

fprintf("Numero médio de dias Dor de sol: %f\n", DorSol);
fprintf("Numero nédio de dias Dor de chuva: %f\n", dorChuva);
