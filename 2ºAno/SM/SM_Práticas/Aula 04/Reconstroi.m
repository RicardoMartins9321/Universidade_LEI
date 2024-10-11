function x = Reconstroi(X, Ta)
    N = length(X);              % Número de amostras
    x = ifft(fftshift(X*N));    % Transformada Inversa de Fourier de X
    t = (0:N-1)*Ta;             % Vetor de tempo

    % Plot do sinal reconstruído
    figure;
    plot(t, real(x));
    title('Sinal Reconstruído');
    xlabel('Tempo (s)');
    ylabel('Amplitude');
    grid("on");
end

%{
A função Reconstroi recebe como entrada o vetor X que representa o espectro 
de um sinal e um período de amostragem Ta, e retorna um vetor x que é a sequência 
de amostras do sinal no domínio do tempo. A função ifft é usada para calcular a 
Transformada Inversa de Fourier do vetor de entrada X. A função fftshift é usada 
para reordenar o vetor de entrada X de modo que a componente de frequência zero 
seja centralizada. O espectro é então multiplicado pelo número de amostras N 
para desfazer a normalização feita na função Espetro.

O vetor de tempo t é criado para corresponder ao tempo de cada amostra do sinal. 
O vetor varia de 0 a (N-1)*Ta, com um incremento de Ta.

Por fim, a função gera um gráfico do sinal reconstruído, onde o eixo das abscissas 
representa o tempo e o eixo das ordenadas representa a amplitude do sinal. A função 
real é usada para garantir que o sinal plotado seja real, pois a função ifft pode 
retornar um sinal complexo devido a erros de arredondamento, mesmo que o sinal original seja real.
%}