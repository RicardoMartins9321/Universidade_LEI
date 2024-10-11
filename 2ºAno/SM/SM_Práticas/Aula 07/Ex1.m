%% Ex 1
load("Guitar03.mat")

%soundsc(x,fa);

%% Ex 2
teta=2*pi*(5000/fa);
xr=x+ 0.6*cos(teta*(0:length(x)-1)'+0.1*pi);
%soundsc(xr,fa);

%% Ex 3 a)
load("Guitar03.mat")
R = 0.9;
teta = 2*pi*(5000/fa);
num = [1 -2*cos(teta) 1];
den = [1 -2*R*cos(teta) R^2];

[Hz, freq] = respfreq(num, den, fa);

[H1,f1]=freqz(num,den,1024,fa, 'whole');
% Plot the magnitude response
figure;
plot(f1, 20*log10(abs(H1)));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Frequency Response');
grid on;

%% b)
% Compute the frequency response using freqz
N = 1024;
[H, f] = freqz(num, den, N, fa, 'whole');
H1 = fftshift(H);

% Generate an input signal (e.g., a sinusoid of 1000Hz)
t = 0:1/fa:1; % time vector for 1 second
xr = x+ 0.6*cos(teta*(0:length(x)-1)'+0.1*pi);

% Apply the filter to the input signal
y = filter(num, den, xr);

% Plot the results in a divided graphical window
figure;

% Plot the frequency content of xr
subplot(3, 1, 1);
plot(t, xr);
xlabel('Time (s)');
ylabel('Amplitude');
title('Input Signal (xr)');

% Plot the magnitude response (frequency content) of H
subplot(3, 1, 2);
plot(f, 20*log10(abs(H)));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Frequency Response (H)');

% Plot the frequency content of the output signal y
subplot(3, 1, 3);
plot(t, y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Output Signal (y)');

% Play the output signal to listen to it
sound(y, fa);

% Comment on the results
disp('You should see a divided graphical window with plots for input signal, frequency response, and output signal.');
disp('Additionally, you should be able to hear the output signal.');

% If the input is a sinusoid of 1000Hz, the output should follow the frequency response of the filter.

%% Ex 4
a = 0.9;
t = 2*17/340;
D = t/(1/fa);

% Calculate the magnitude response for various frequencies
frequencies = linspace(-pi, pi, 1000);
z_values = exp(1i * frequencies);
H = freqz([1 zeros(1,D-1) a], 1, z_values);

% Plot the magnitude response
figure;
plot(frequencies, abs(H));
xlabel('Frequency (radians)');
ylabel('Magnitude');
title('Magnitude Response of the Echo Generator');
grid on;

% Display the range of the magnitude
disp(['Magnitude varies between ', num2str(1 - a), ' and ', num2str(1 + a)]);

%% b)
load('Guitar03.mat'); % Load your signal
a = 0.9;                % Given value for 'a'
t = 2*17/340;
D = t/(1/fa);
num = [1 zeros(1,D-1) a];

% Simulate the system
sinal = x;
sinal_filtrado = filter(num, den, sinal);

title("Sinal filtrado para Guitar.mat");
plot(sinal_filtrado);

[x,fa] = audioread("vozportugues.wav");
sinal_filtrado2 = filter(num, den, x);
plot(sinal_filtrado2)

%% c)
a = 0.9;  
D = 8;   

% Calculate the magnitude response for various frequencies
frequencies = linspace(0, pi, 1000);
H_infinite_reflections = 1 ./ sqrt(1 + a^2 - 2*a*cos(D*frequencies));

% Plot the magnitude response
figure;
plot(frequencies, H_infinite_reflections);
xlabel('Frequency (radians)');
ylabel('Magnitude');
title('Magnitude Response for Infinite Reflections');
grid on;
