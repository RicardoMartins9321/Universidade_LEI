function [y,t] = ReconstroiSinal(x,Ta)
    N = length(x);  % número de amostras
    y = zeros(100*N,1); % inicializar o array com zeros
    fa = 1/Ta;  % frequência de amostragem
    fs = 100*fa;    % frequência de amostragem do exercicio

    t = (0 : (length(y)-1))'*(1/fs);

    for n=1:N
        y = y + x(n)*sinc(fa*(t-(n-1)*Ta));
    end

end