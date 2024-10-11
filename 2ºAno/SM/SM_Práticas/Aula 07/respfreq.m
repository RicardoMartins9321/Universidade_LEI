function [H,f] = respfreq(num,den,fa)
    % Generate the frequency vector
    N = 1024; % Number of points for frequency response
    f = (-N/2:N/2-1)*(fa/N);

    % Compute the frequency response
    H = freqz(num, den, f, fa)';
    H = abs(fftshift(H));   % center the graph

    figure;
    plot(f, 20*log10(abs(H)));
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    title('Frequency Response');
    grid;
end