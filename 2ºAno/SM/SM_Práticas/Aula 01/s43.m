w = linspace(0,2*pi,200);

f = sin(4*w).*exp(1i*w);

g = sin(8*w).*exp(1i*w);

plot(f,"g");
hold on;
plot(g,"r");
hold off;
xlabel("Real");
ylabel("Imaginário");
title("Gráficos")

