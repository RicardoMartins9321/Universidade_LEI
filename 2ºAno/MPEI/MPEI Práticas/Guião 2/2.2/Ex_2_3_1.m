%% Ex 2.3.1 a)
N = 1e5;    % número de simulações
p1 = 0.002; % prob do componente 1 sair com defeito
p2 = 0.005; % prob do componente 2 sair com defeito
pa = 0.01;  % prob de defeito na montagem independentemente dos componentes
n = 8;

% Probabilidade de um brinquedo ser defeituoso sabendo que Um brinquedo 
% está com defeito se pelo menos um de seus componentes estiver com defeito
p_defeito = p1 + p2 + pa;

defeitos = rand(n,N) < p_defeito;
probTemp = sum(defeitos);

num_caixas_defeito = 0;

% Simulação
for i = 1:N
    if probTemp(i) >= 1
        num_caixas_defeito = num_caixas_defeito + 1;
    end
end

probA = num_caixas_defeito / N
fprintf("ProbA: %6f\n", probA);

defeituosos_1 = rand(n,N)<=p1;
defeituosos_2 = rand(n,N)<=p2;
defeituosos_a = rand(n,N)<=pa;

defeituosos = defeituosos_1 | defeituosos_2 | defeituosos_a;
defeituosos = sum(defeituosos)>0; % identifica as caixas com pelo menos um boneco defeituoso
prob = sum(ex)/N;

fprintf("Prob: %6f\n", prob);

%% Ex 2.3.1 b) valor certo 0.623
N = 1e5;    % número de simulações
p1 = 0.002; % prob do componente 1 sair com defeito
p2 = 0.005; % prob do componente 2 sair com defeito
pa = 0.01;  % prob de defeito na montagem independentemente dos componentes
n = 8;

ex_1 = rand(n,N)<=p1;
ex_2 = rand(n,N)<=p2;
ex_a = rand(n,N)<=pa;

ex = ex_1 | ex_2 | ex_a;
ex = sum(ex)>0; % identifica as caixas com pelo menos um boneco defeituoso
probTemp = ~ex_1 & ~ex_2 & ex_a;
prob = sum(sum(probTemp)) / sum(ex);
fprintf("Número médio de brinquedos: %6f\n", prob);
