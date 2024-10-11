function [ak,bk] = FourierCoef_v2(Ta,T,x,K)
    ak=zeros(1,K);  % criar o espaço na memória para o sinal
    bk=zeros(1,K);  % criar o espaço na memória para o sinal
    N=length(x);
    f=1/T;
    
    for  n=1:N
        ak(1) = ak(1)+(1/N)*x(n);   % calcular o valor médio
    end

    for k=2:K
        for n=1:N
            ak(k) = ak(k) + 2/N*x(n)*cos(2*pi*(k-1)*f*n*Ta);
            bk(k) = bk(k) + 2/N*x(n)*sin(2*pi*(k-1)*f*n*Ta);
        end
    end
end
