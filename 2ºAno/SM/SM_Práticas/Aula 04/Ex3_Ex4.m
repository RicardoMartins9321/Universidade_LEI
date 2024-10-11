%{
Os exemplos acima assumem que a frequência de amostragem é 100 Hz para os sinais a), c), d) e e), 
e 1000 Hz para o sinal b). Esses valores foram escolhidos para garantir uma 
resolução de frequência adequada nos resultados da DFT. Os vetores de tempo 
são criados para abranger a duração especificada de cada sinal. Cada sinal é 
então passado para a função Espetro, que retorna o espectro de amplitude e o 
vetor de frequências correspondente, e gera o gráfico do espectro.
%}
t = linspace(0,3*pi)';
x = square(t);
plot(t/pi,x,'.-')
xlabel('t / \pi')
grid on

%% a)
Ta = 1/100;  % Período de amostragem
t = 0:Ta:2;  % Vetor de tempo para 2 períodos
x = sin(2*pi*t);
[X, f] = Espetro(x, Ta);
x_reconstruido = Reconstroi(X, Ta);

t = 0:Ta:100;  % Vetor de tempo para 100 períodos
x = sin(2*pi*t);
[X, f] = Espetro(x, Ta);
x_reconstruido = Reconstroi(X, Ta);

%% b)
Ta = 1/1000;  % Período de amostragem
t = 0:Ta:50;  % Vetor de tempo para 50 segundos
y = sin(10*pi*t) + cos(12*pi*t) + cos(14*pi*t - pi/4);
[Y, f] = Espetro(y, Ta);
y_reconstruido = Reconstroi(Y, Ta);

%% c)
Ta = 1/100;  % Período de amostragem
t = 0:Ta:100;  % Vetor de tempo para 100 períodos
y = 10 + 14*cos(20*pi*t - pi/3) + 8*cos(40*pi*t + pi/2);
[Y, f] = Espetro(y, Ta);
y_reconstruido = Reconstroi(Y, Ta);

%% d)
Ta = 1/100;  % Período de amostragem
t = 0:Ta:5;  % Vetor de tempo para 5 segundos
z = square(2*pi*t);  % Onda quadrada de frequência 1 Hz
% plot(t/pi,z); % gráfico square
[Z, f] = Espetro(z, Ta);
z_reconstruido = Reconstroi(Z, Ta);

%% e)
Ta = 1/100;  % Período de amostragem
t = 0:Ta:5;  % Vetor de tempo para 5 segundos
q = sawtooth(2*pi*t, 0.5);  % Onda triangular de frequência 1 Hz
% plot(t/pi,q); %gráfico sawtooth
[Q, f] = Espetro(q, Ta);
q_reconstruido = Reconstroi(Q, Ta);
