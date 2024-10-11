%% Ex 2.2.1 a)
% função massa de probabilidade P(X=xi)
xi = 1:6;   % xi é o dominio, valores a serem usados, 6  faces dos dados

% p vai ser igual ao número de casos que verificam a condição X=xi a
% dividir pelo número de casos totais, neste caso cada uma das faces a dividir 
% pelas 6 faces do dado, pois todas estas têm uma igual probabilidade
p=ones(1,6)/6;

% fazer o desenho do gráfico numa forma que demonstra melhor as diferentes 
% probabilidades de cada situação xi acontecer
stem(xi,p)  
xlabel("x"), 
ylabel("px(x)");
axis([0 7 0 1/5]);

%% Ex 2.2.1 b)
% função distribuição acumulada Fx(x) = Px(X<=x)  = somatório de i até xi<x de px(x)
% ou seja um foor loop do somatório de cada probabilidade individual até
% chegar ao 1, Fx(x) tende para 0 em -infinito e para 1 quando vai para +infinito
x = 1:6; % x é o dominio, valores a serem usados, 6  faces dos dados
probs = ones(1,6)/6; 

%{
Fx = zeros(1,length(x));
for x = 1:7
    Fx(x) = Fx(x-1) + ones(1,6)/6;
end
%}

% função já existente do MATLAB que faz o somatório dos valores para cada
% elemento fazendo um array com o mesmo tamnho daquele que lhe foi dado.
Fx = cumsum(probs);

stairs([0 x 7], [0 Fx 1]) 
xlabel("x"); 
ylabel("Fx(x)");
axis([0 7 0 1.1]);
grid on;
