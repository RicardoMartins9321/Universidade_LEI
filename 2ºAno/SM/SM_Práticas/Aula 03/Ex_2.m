Ta = 1;
f0 = 1;
Np = 6;
ak = zeros(1,k);
bk = zeros(1,k-1);

plot(1:6,FourierFunction(Ta,f0,Np,ak,bk))