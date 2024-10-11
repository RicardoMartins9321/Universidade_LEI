clear all
% A)

T = [ 0   0   0    0   0  0
      0.2 0   0    0.9 1  0
      0   0.7 0    0.1 0  0
      0   0.3 0.55 0   0  0
      0.8 0   0    0   0  0
      0   0   0.45 0   0  1];

% Verificação se a matriz está bem
sum(T)
T>=0 & T<=1;

% B)
% Calcular o percurso mais pequeno ate à meta
% Percurso mais pequeno é 1,2,3,Meta(6)
% Logo 0.2*0.7*0.45)

Prob = T(2,1)*T(3,2)*T(6,3);

% C)
% Número médio de casas percorridas des o início até ao fim do jogo
% (incluindo a inicial e final)

Q = [ 0 0 0 0 0 
      0.2 0 0 0.9 1
      0 0.7 0 0.1 0
      0 0.3 0.55 0 0
      0.8 0 0 0 0];

F = (eye(5,5)- Q)^(-1);

sum(F(:,1))+1 % primeira linha ja inclui a posiçao inicial e + 1 para a casa final
              % isto dá a média de casas por jogo para um jogador


x0 = [1; 0; 0; 0; 0; 0];

T3 = T^3 * x0;
fprintf("Probabilidade: %f\n", T3(6)*100);