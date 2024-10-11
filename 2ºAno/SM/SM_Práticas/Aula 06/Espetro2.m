function [X, f] = Espetro2(x, Ta, fcut_low, fcut_high)
    N = length(x);              % Número de amostras
    fa = 1/Ta;                  % Frequência de amostragem
    X = fftshift(fft(x))/N;     % DFT de x
    f = (-fa/2):(fa/N):(fa/2)-(fa/N);  % Vetor de frequências

    % Aplicar o filtro no domínio da frequência
    X(abs(f) < fcut_low | abs(f) > fcut_high) = 0;

    % Plot do espectro
    figure;
    plot(f, abs(X));
    title('Espectro de Amplitude');
    xlabel('Frequência (Hz)');
    ylabel('Amplitude');
    grid("on");
end
