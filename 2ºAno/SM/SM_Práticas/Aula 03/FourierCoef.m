function [ak,bk] = FourierCoef(Ta,T,x,k)
    N=length(x);
    f=1/T;
    t = (0 : (N-1))'*Ta; 
    
    ak=zeros(k+1,1);  % criar o espaço na memória para o sinal
    bk=zeros(k+1,1);  % criar o espaço na memória para o sinal
    ak(1) = mean(x);  % calcular o valor médio
    bk(1) = 0;

    for k=2:k+1
        % multiplicação elemento a elemento '* dava mesma coisa que usar
        % outro loop dentro deste e indo multiplicar o valor do x(n)
        ak(k) = (2/N)*x'*cos(2*pi*(k-1)*f*t);
        bk(k) = (2/N)*x'*sin(2*pi*(k-1)*f*t);
    end
end
