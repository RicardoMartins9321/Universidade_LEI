N = 10000;
Ta = 0.001;

[x,t] = GeraSinal(N,Ta);

[X,f] = Espetro(x,Ta);
filtro = zeros(1,length(f));
filtro(abs(f)<2) = 1;
Y = filtro' .* X;

[X,T] = Reconstroi(Y,f);

plot(t,x, f,X, T,X)

legend("Original","Espetro","Filtrado")
grid;
xlim([0 5])
ylim([-2 2])
