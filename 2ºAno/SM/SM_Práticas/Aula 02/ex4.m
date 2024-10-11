Ta = 1/25;

x1 = -5:Ta:5;
x2 = -5:Ta:5;
t = 0:Ta:5;
N = length(t);
[X1,X2] = meshgrid(x1,x2);

for k=1:N
    r = 2*sin(2*pi*sqrt(X1.^2 + X2.^2) - 2*pi*t(k));
    mesh(x1,x2,r);
    view(2);
    drawnow();
end

