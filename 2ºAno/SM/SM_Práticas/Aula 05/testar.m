Ta = 0.01;   % periodo de amostragem
t = (0 : Ta : 2-Ta)'; % vetor de tempo
sig = sin(2*pi*t);
nbit = 2;

delta = (2*max(abs(sig)))/2^nbit;
partition = -1+2*delta/2 : delta : 1-delta/2;
codebook = -1+delta/2 : delta : 1-delta/2;

[index,quantized] = quantiz(sig, partition, codebook);

[x,fx] = Espetro(sig,Ta);
legend("Sinal original");
hold on;
[x2,fx2] = Espetro(quantized,Ta);
legend("Sinal quantizado");

[y,t] = ReconstroiSinal(quantized,Ta);
plot(t, y);
legend("Sinal resconstruido")
grid;