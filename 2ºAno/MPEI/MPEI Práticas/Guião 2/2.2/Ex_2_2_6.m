%% Ex 2.2.6 a)
probT = prob_teorica(7,8000,0.001)

%% Ex 2.2.6 b)
lambda = 8000*0.001;
k = 7;

pk = ((lambda^k)/factorial(k))*exp(-lambda) 
