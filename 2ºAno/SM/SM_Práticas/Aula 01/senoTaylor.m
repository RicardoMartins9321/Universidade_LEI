function s = senoTaylor(N,x)

% Código para criar um somatório
s = 0;
for n= 1:1:N
    s = s + (x.^n/factorial(n))*sin(n*pi/2);
end

end


