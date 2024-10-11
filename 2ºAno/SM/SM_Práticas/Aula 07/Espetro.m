function [X,f] = Espetro(x,Ta)
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