x = linspace(0,2*pi);
y1 = sin(x);
y2 = senoTaylor(2,x);
y3 = senoTaylor(10,x);

plot(x,y1,x,y2,x,y3);
legend("y1","y2","y3");