%% a)
Ta = 0.2;   % periodo de amostragem
t = 0:Ta:5; % vetor de tempo

x = sin(2*pi*t);

[y,t] = ReconstroiSinal(x,Ta);

plot(t,y);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal Reconstruído');
grid;

%% b)

Ta = 0.04;  % periodo de amostragem
t = 0:Ta:5; % Defina o vetor de tempo

% sinal
x = sin(10*pi*t)+cos(12*pi*t)+cos(14*pi*t-(pi/4));

[y,t] = ReconstroiSinal(x,Ta);

% Plotar o sinal reconstruído
plot(t,y)
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Sinal Reconstruído');
grid;