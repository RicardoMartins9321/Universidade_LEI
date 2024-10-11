%Ex2.

Ta = 0.01;  % período de amostragem
f0 = 1;     % frequencia
Np = 6;     % número de períodos
k = 100;    % número de amostras

ak = zeros(1,k);
bk = zeros(1,k-1);

impares = 1:2:k-1;
bk(impares) = 4./(impares*pi);
bk = [0,bk];

[xt,t] = FourierFunction(Ta,f0,Np,ak,bk);

figure(1);
plot(t,xt, LineWidth=2);
xlabel('Tempo (seg)');
ylabel('x(t)');
title("Grafico Onda Sinusoidal");
grid on;
