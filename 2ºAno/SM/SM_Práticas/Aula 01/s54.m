x = linspace(-1,1,51);
y = linspace(-1,1,51);
[xx,yy] = meshgrid(x,y);

f = cos(4*pi*(xx+yy)).*exp(-abs(xx+yy));
surf(x,y,f), shading interp;
xlabel("x");
ylabel("y");
zlabel("z");