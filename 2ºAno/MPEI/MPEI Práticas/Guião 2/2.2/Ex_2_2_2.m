%% Ex 2.2.2 a)
notas_5euros = 90;
notas_50euros = 9;
notas_100euros = 1;

prob5 = 90/100;
prob50 = 9/100;
prob100 = 1/100;

%% Ex 2.2.2 b)
% função massa de probabilidade P(X=xi)
notas_5euros = 90;
notas_50euros = 9;
notas_100euros = 1;
notas_totais = notas_5euros+notas_50euros+notas_100euros;

prob5 = notas_5euros/notas_totais;
prob50 = notas_50euros/notas_totais;
prob100 = notas_100euros/notas_totais;

Sx = [5 50 100];
probs = [prob5 prob50 prob100];

stem(Sx, probs)
xlabel("xi - (valor das notas)");
ylabel("Probabilidade(X=xi)");
axis([0 105 0 1]);
grid on

%% Ex 2.2.2 c)
% função distribuição acumulada Fx(x) = Px(X<=x) = somatório de i até xi<x de px(x)

notas_5euros = 90;
notas_50euros = 9;
notas_100euros = 1;
notas_totais = notas_5euros+notas_50euros+notas_100euros;

prob5 = notas_5euros/notas_totais;
prob50 = notas_50euros/notas_totais;
prob100 = notas_100euros/notas_totais;

Sx = [5 50 100];
probs = [prob5 prob50 prob100];

% função já existente do MATLAB que faz o somatório dos valores para cada
% elemento fazendo um array com o mesmo tamnho daquele que lhe foi dado.
Fx = cumsum(probs);

stairs([0 Sx 105],[0 Fx 1])
xlabel("x"); 
ylabel("Fx(x)");
grid on;

