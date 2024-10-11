x = linspace(-2*pi,0,200);
y = sin(x).*exp(x);

plot(x,y,".r");
axis([-8,0,-0.5,0.8]);
xlabel("x");
ylabel("y");
title("Gráfico de sin(x)e^x");