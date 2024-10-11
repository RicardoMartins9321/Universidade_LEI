%% Ex 3.1
% b)
%    1      3   5   7   9   Fim
T = [0      1/4 0   1/4 0   0;      %1
     1/3    0   1/2 0   1/3 0 ;     %3
     1/3    1/4 0   1/4 0   0;      %5
     1/3    0   1/2 0   1/3 0;      %7
     0      1/4 0   1/4 0   0;      %9
     0      1/4 0   1/4 1/3 0];     %Fim

% c)
v0 = [1/4 ; 1/8 ; 1/4 ; 1/4 ; 1/8]
rand=randi(5);
stateC=crawl(T,rand,6)

% d)
N = 1e6;
array = cell(1,N);

for i = 1:N

    rand=randi(5);

    stateD=crawl(T,rand,6);
    array{i}=stateD;
end

% e)
cf = 0;

for i = 1:N
    if length(array{i}) == 6
        if array{i} == [5 4 1 3 2 6]
            cf = cf + 1;
        end
    end
end

prob = cf / N;
disp("Probabilidade de obter a string '97153'")
disp(prob)
%%
1/(2^8*3^2)
%% g)
count = 0;
soma = 0;

for i = 1:N
    stateT = crawl(T,rand,6);

    if state(1) == 4
        count = count + 1;
        soma = soma + (length(stateT)-1);
    end
end

fprintf("O comprimento medio das palavras começadas em 7 é: %f", soma/count)

