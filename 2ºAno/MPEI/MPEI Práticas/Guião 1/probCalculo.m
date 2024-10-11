function [prob] = probCalculo(p,k,n)

% faz o cálculo da probabilidade analítica através da seguintes fórmula
prob = nchoosek(n,k)*p^k*(1-p)^(n-k); % nchoosek(n,k)= n!/(n-k)!/k!h

end