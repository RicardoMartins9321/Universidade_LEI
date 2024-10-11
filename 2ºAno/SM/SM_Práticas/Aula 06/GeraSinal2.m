function [x, t] = GeraSinal2(N, Ta)
    % Gerar a sequência de tempo
    t = linspace(0, (N-1)*Ta, N);

    % Gerar a componente determinística
    x_deterministic = sin(2*pi*t);

    % Gerar a componente estocástica
    phi1 = cumsum(sqrt(Ta)*randn(1, N));
    phi2 = cumsum(sqrt(Ta)*randn(1, N));
    r = 0.5*sin(20*pi*t + 10*phi1) + 0.5*sin(24*pi*t + 10*phi2);

    % Gerar o sinal completo
    x = x_deterministic + r;
end

%{%
% Neste código, a função linspace gera uma sequência de tempo de N pontos 
% igualmente espaçados de 0 a (N-1)*Ta. A função sin é usada para gerar a 
% componente determinística do sinal. A função randn gera uma variável aleatória 
% de distribuição normal, que é então integrada usando a função cumsum para 
% obter phi1 e phi2. Estes são usados para gerar a componente estocástica do 
% sinal. Finalmente, a componente determinística e a componente estocástica 
% são somadas para obter o sinal completo}