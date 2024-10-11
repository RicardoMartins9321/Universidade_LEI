N = 10000;
Ta = 0.001;

[x,t] = GeraSinal(N,Ta);

[X,f] = Espetro(x,Ta);

plot(f,X, T,X)
grid on

%{
[x2,t2] = GeraSinal2(N,Ta);

[X2,f2] = Espetro(x2,Ta);
grid on
%}