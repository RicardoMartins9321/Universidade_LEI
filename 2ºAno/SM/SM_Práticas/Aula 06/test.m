load("Guitar03.mat");

Ta = 1/fa;

[X, f] = Espetro2(x, Ta, 100, 400);
sound(w, fa);

[X, f] = Espetro2(x, Ta, 400, 600);
sound(w, fa);

[X, f] = Espetro2(x, Ta, 600, 1200);
sound(w, fa);
