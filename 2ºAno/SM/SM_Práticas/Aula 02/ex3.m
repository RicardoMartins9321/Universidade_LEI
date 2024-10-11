Ta  = 0.01;

t = 0:Ta:5;
x = 2*sin(4*pi*t);

plot(t,x,"r-","LineWidth",1);
xlabel("Tempo (s)")
ylabel("Amplitude (A)")
title("Sinais")
hold on;

t = 0:Ta:5;
y = cos(10*pi*t);

plot(t,y,"b--","LineWidth",3);

t = 0:Ta:5;
z = x.*y;

plot(t,z,"g-.","LineWidth",1);

t = 0:Ta:10;
w = 3*sin(pi*t) + 2*sin(6*pi*t);

plot(t,w,"y-","LineWidth",3);
hold off;