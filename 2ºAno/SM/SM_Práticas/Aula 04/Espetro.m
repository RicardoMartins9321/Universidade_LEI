function [X, f] = Espetro(x, Ta)
    N = length(x);              % Número de amostras
    fa = 1/Ta;                  % Frequência de amostragem
    X = fftshift(fft(x))/N;     % DFT de x
    f = (-fa/2):(fa/N):(fa/2)-(fa/N);  % Vetor de frequências
    X = abs(X);                 % Amplitude do espectro

    % Plot do espectro
    figure;
    plot(f, X);
    title('Espectro de Amplitude');
    xlabel('Frequência (Hz)');
    ylabel('Amplitude');
    grid("on");
end

%{
A função fft do MATLAB é usada para calcular a DFT do vetor de entrada x. 
A função fftshift é usada para reordenar o vetor de saída da fft de modo que
a componente de frequência zero seja centralizada. O espectro é então normalizado
pela quantidade de amostras N. A função abs é usada para calcular a 
amplitude do espectro, que é o módulo dos coeficientes complexos da DFT.

O vetor de frequências f é criado para corresponder às frequências de cada 
componente do espectro. O vetor varia de -fa/2 a +fa/2, com um incremento de fa/N.

Por fim, a função gera um gráfico do espectro de amplitude, onde o eixo das 
abscissas representa a frequência em Hz e o eixo das ordenadas representa a amplitude do espectro.

Note que essa função assume que o vetor de entrada x é um sinal real e de duração 
finita, e que o período de amostragem Ta é um escalar positivo. Além disso, 
a função não faz nenhuma verificação de erro ou validação de entrada.
%}
