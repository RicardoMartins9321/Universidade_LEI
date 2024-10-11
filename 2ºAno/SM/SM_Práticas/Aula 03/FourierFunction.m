function [xt,t] = FourierFunction(Ta,f0,Np,ak,bk)
  N = round(Np/(f0*Ta));    % número de amostrasa considerar
  t = (0 : (N-1))'*Ta;      % criar o espaço na memória para o sinal
  xt = zeros(N,1);          % criar o espaço na memória para o sinal

  % função para criar o sinal
  for k=1 : length(ak)
      xt = xt + ak(k)*cos(2*pi*(k-1)*f0*t) + bk(k)*sin(2*pi*(k-1)*f0*t);
  end
    
end