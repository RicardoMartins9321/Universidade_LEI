function x = Reconstroi2(X, Ta)
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