Ta  = 0.1;

%a)
t = 0:Ta:5;
x = 2*sin(4*pi*t);

figure(1);
plot(t,x);
xlabel("Tempo (s)")
ylabel("Amplitude (A)")
title("Sinal A")

%b)
t = 0:Ta:5;
y = cos(10*pi*t);

figure(2);
plot(t,y);
xlabel("Tempo (s)")
ylabel("Amplitude (A)")
title("Sinal B")

%c)
t = 0:Ta:5;
z = x.*y;

figure(3);
plot(t,z);
xlabel("Tempo (s)")
ylabel("Amplitude (A)")
title("Sinal C")

%d)
t = 0:Ta:10;
w = 3*sin(pi*t) + 2*sin(6*pi*t);

figure(4);
plot(t,w);
xlabel("Tempo (s)")
ylabel("Amplitude (A)")
title("Sinal D")

%e)
t1 = 0:Ta:5;
t2 = 0:Ta:5;
[T1,T2] =  meshgrid(t1,t2);
q = 2*sin(2*pi*(2*T1 + T2));

figure(5);
surf(t1,t2,q),shading interp;
xlabel("Tempo 1 (s)")
ylabel("Tempo 2 (s)")
zlabel("Amplitude (A)")
title("Sinal E")