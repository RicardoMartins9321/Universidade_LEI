clear all

%% A)
% 400 palavras (m)
% 1 funçao (k)
% ? tamanho (n)
% pfp = 2% = 0.02

m = 400;
k = 1;
pfp = 0.02;
N = 1;
while true
    pfptest = (1-exp((-k*m)/N))^k;
    if abs(pfp-pfptest) < 0.00001
        break
    end
    N = N+1;
end

%% B)
alfabeto = 'a':'z';
wordArr1 = GenerateString(m,alfabeto);
wordArr2 = GenerateString(4000, alfabeto);
B = BloomInit(N,k);

for i=1:length(wordArr1)
    word = wordArr1{i};
    B = BloomInsert(B,word,k);
end

fp = 0;
for i=1:length(wordArr2)
    word = wordArr2{i};
    if BloomVerify(B,word,k) == 1
        fp = fp +1;
    end
end
fprintf("Num False Positives %d\n", fp);
fprintf("Percentage of False Positives %.3f\n", fp/4000);