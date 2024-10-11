%% Ex 2.3.2 a)
N = 1e5;    % número de simulações
p1 = 0.002; % prob do componente 1 sair com defeito
p2 = 0.005; % prob do componente 2 sair com defeito
pa = 0.01;  % prob de defeito na montagem independentemente dos componentes
n = 8;

defeituosos_1 = rand(n,N)<=p1;
defeituosos_2 = rand(n,N)<=p2;
defeituosos_a = rand(n,N)<=pa;

defeituosos = defeituosos_1 | defeituosos_2 | defeituosos_a;
% identifica as caixas que não têm um único boneco defeituoso
defeituosos = 1-sum(defeituosos)>0; 
probA_sim = sum(defeituosos)/N;

fprintf("ProbA: %6f\n", probA_sim);

%% Ex 2.3.2 b)
p1 = 0.002; % probabilidade do componente 1 sair com defeito
p2 = 0.005; % probabilidade do componente 2 sair com defeito
pa = 0.01;  % probabilidade de defeito na montagem independentemente dos componentes

probB_teo = power((1 - p1) * (1 - p2) * (1 - pa),8);
fprintf("ProbB: %6f\n", probB_teo);

%% Ex 2.3.2 c)


%% Ex 2.3.2 d)