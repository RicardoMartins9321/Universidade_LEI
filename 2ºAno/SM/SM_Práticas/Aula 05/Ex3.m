%% nbit=2
Ta = 0.01;
t = (0 : Ta : 2-Ta)'; % vetor de tempo
sig = sin(2*pi*t);
nbit = 2;

delta = (2*max(abs(sig)))/2^nbit;
partition = -1+2*delta/2 : delta : 1-delta/2;
codebook = -1+delta/2 : delta : 1-delta/2;

[index,quantized] = quantiz(sig, partition, codebook);

plot(t,sig, t,quantized);
xlabel('Tempo (s)');
ylabel('Amplitude');
legend("Original signal", "Quantized signal");
grid;

%% nbit=3
Ta = 0.01;
t = (0 : Ta : 2-Ta)'; % vetor de tempo
sig = sin(2*pi*t);
nbit = 2;

delta = (2*max(abs(sig)))/2^nbit;
partition = -1+2*delta/2 : delta : 1-delta/2;
codebook = -1+delta/2 : delta : 1-delta/2;

[index,quantized] = quantiz(sig, partition, codebook);

plot(t,sig, t,quantized);
xlabel('Tempo (s)');
ylabel('Amplitude');
legend("Original signal", "Quantized signal");
grid;

%% nbit=4
Ta = 0.01;
t = (0 : Ta : 2-Ta)';
sig = sin(2*pi*t);
nbit = 20;
amp=2*max(abs(sig));
Npal = 2^nbit;
Delta = amp/Npal;
partition = [-1+2*Delta/2 : Delta : 1-Delta/2];
codebook = [-1+Delta/2 : Delta : 1-Delta/2];
[index,quants] = quantiz(sig,partition,codebook);

figure(3);
plot(t,sig,t,quants);
legend("Original signal", "Quantized signal");
grid
