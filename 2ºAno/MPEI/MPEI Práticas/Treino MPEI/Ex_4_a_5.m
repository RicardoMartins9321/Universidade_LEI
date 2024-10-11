%% Ex 1.4
% a)
p = 0.4;
q = 0.6;

AtoA = p^2;
AtoB = (1-p)^2;
AtoC = p*(1-p);
AtoD = p*(1-p);

BtoA = 0;
BtoB = 0;
BtoC = 0;
BtoD = 1;

CtoA = 0;
CtoB = 0;
CtoC = 0;
CtoD = 1;

DtoA = q^2;
DtoB = q*(1-q);
DtoC = q*(1-q);
DtoD = (1-q)^2;

T = [AtoA    BtoA    CtoA    DtoA ; 
     AtoB    BtoB    CtoB    DtoB ; 
     AtoC    BtoC    CtoC    DtoC ;
     AtoD    BtoD    CtoD    DtoD]

% b)
x0 = [1; 0; 0; 0]; % inicar no estado A

for i = 1:201
    X_prox = T^(i-1)*x0;
    prob_percentagem = X_prox;
    if (i==6 || i==11 || i==101 || i==201)
        fprintf('Probabilidade estado A após %d transições: %.5f%%\n', i-1,prob_percentagem(1));
        fprintf('Probabilidade estado B após %d transições: %.5f%%\n', i-1,prob_percentagem(2));
        fprintf('Probabilidade estado C após %d transições: %.5f%%\n', i-1,prob_percentagem(3));
        fprintf('Probabilidade estado D após %d transições: %.5f%%\n', i-1,prob_percentagem(4));
    end
end

% c)
% era so meteres uma valor muito grande para simular que estavas a ir para
% o infinito


%% Ex 1.5
% a)
T = [0.7    0.2    0.3 ; 
     0.2    0.3    0.3 ; 
     0.1    0.5    0.4]

% b) 
x0 = [1 ; 0 ; 0]; % 1º dia sol

T_sol2 = T*x0;
T_sol3 = T^2*x0;
Sol2 = 0.7
% prob de passar de sol para sol + prob de passar de chuva para sol + prob de nuvens para sol
Sol3 = 0.7*0.7+0.2*0.2+0.3*0.1
fprintf("prob de estar sol segundo dia: %f \n", T_sol2(1))
fprintf("prob de estar sol terceiro dia: %f \n", T_sol3(1))

% c)
dia2 = T*x0;

% prob de passar de sol para sol ou de sol para nuvens
sol3 = dia2(1)*0.7 + dia2(1)*0.2;
% prob de nuvens passar para nuvens + prob de nuvens passar para sol
nuvem3 = dia2(2)*0.3 + dia2(2)*0.2;

probNaoChuva = sol3+nuvem3  % prob nao chuva será a prob de um caso mais o outro

% d)
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

% e)
% iagual ao anterior, apenas muda x0 para [0 ; 0 ; 1]

% f)
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
