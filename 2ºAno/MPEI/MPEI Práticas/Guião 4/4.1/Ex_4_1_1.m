%% Ex 1 a)
N = 10^5;
i_min = 6;
i_max = 20;
vetorChars = ['A':'Z' 'a':'z']; % cria um vetor de caracteres do A até ao Z e do a ao z

tic
% são equiprovaveis logo não é necessário vetor de probabilidades
% strings_v1 = dispersao(N, i_min, i_max, vetorChars);
keysA = randStringArray(N, i_min, i_max, vetorChars);
toc
save("keysA.mat", "keysA")

%% Ex 1 b)
N = 10^5;
i_min = 6;
i_max = 20;
vetorChars = ['a':'z'];
probs = load("prob_pt.txt");

keysB = randStringArray(N, i_min, i_max, vetorChars,probs);
save("keysB.mat", "keysB")