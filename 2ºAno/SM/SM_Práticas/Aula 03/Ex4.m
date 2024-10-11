Ta=0.001;
Np=4;
K=100;
T=1; 
f=1/T;
%t=0:Ta:T;

%y=sawtooth(2*pi*f*t+pi/2,1/2);

[ak,bk]=FourierCoef(Ta,T,x,K);
[y,t]=FourierFunction(Ta,f,Np,ak,bk);

plot(t,y, LineWidth=2);
xlabel('Tempo (seg)');
ylabel('y(t)');
title("Grafico Onda Sinusoidal");
grid on;

