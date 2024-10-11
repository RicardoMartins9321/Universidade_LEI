%% Ex 1.c)

x0 = [1/4 ; 1/4 ; 1/4 ; 1/4]; % publicidades equiprovaveis

%    A      B   C   D
T = [0      1/3 1/4 1/2;    %A
     1/3    0   1/4 0.3;    %B
     1/3    1/3 0.1 0.1;    %C
     1/3    1/3 0.4 0.1];   %D

probs = T^(10/2) * x0
probB = probs(2);
fprintf("Prob de escolhida publicidade B às 7:10: %f\n", probB)

%% d)
%    A      B   C   D
T = [0      1/3 1/4 1/2;    %A
     1/3    0   1/4 0.3;    %B
     1/3    1/3 0.1 0.1;    %C
     1/3    1/3 0.4 0.1];   %D

for i = 1:201
    X_prox = T^(i-1)*x0;
    prob_percentagem = X_prox;
    if (i==6 || i==11 || i==101)
        fprintf('Probabilidade estado A após %d transições: %.5f%%\n', i-1,prob_percentagem(1));
        fprintf('Probabilidade estado B após %d transições: %.5f%%\n', i-1,prob_percentagem(2));
        fprintf('Probabilidade estado C após %d transições: %.5f%%\n', i-1,prob_percentagem(3));
        fprintf('Probabilidade estado D após %d transições: %.5f%%\n', i-1,prob_percentagem(4));
    end
end

disp("Matriz de probs finais")
disp(prob_percentagem)





% e) 
%    A      B   C   D
T = [0      1/3 1/4 1/2;    %A
     1/3    0   1/4 0.3;    %B
     1/3    1/3 0.1 0.1;    %C
     1/3    1/3 0.4 0.1];   %D

N=1e5;
sum = 0;
estados = zeros(1,360);

for i = 150:510
    prob = T^(i-1)*x0;
    estados(i) = prob(2);
end
dip(sum(estados) * 2)
