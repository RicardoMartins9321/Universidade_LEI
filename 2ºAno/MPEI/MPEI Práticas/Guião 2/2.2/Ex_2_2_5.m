%% Ex 2.2.5 v1
p_array = 0.001:0.001:1; % array de probabilidades
num_simulations = 100000; % número de simulações

prob_2motores = zeros(size(p_array)); % inicializa array de probabilidades para avião com 2 motores
prob_4motores = zeros(size(p_array)); % inicializa array de probabilidades para avião com 4 motores

for i = 1:length(p_array)
    p = p_array(i);
    
    % avião com 2 motores
    n = 2; % número de motores
    num_failures = sum(rand(num_simulations, n) < p, 2); % número de falhas em cada simulação
    prob_2motores(i) = sum(num_failures >= 1) / num_simulations; % a probabilidade de pelo menos um motor falhar
    
    % avião com 4 motores
    n = 4; % número de motores
    num_failures = sum(rand(num_simulations, n) < p, 2); % número de falhas em cada simulação
    prob_4motores(i) = sum(num_failures >= 3) / num_simulations; % a probabilidade de pelo menos três motores falharem
end

% Agora você pode plotar as probabilidades em função de p
figure;
plot(p_array, prob_2motores, 'r-', p_array, prob_4motores, 'b-');
xlabel('Probabilidade de falha do motor');
ylabel('Probabilidade de falha do avião');
legend('2 motores', '4 motores');
grid on;

%% Ex 2.2.5 v2

p = logspace(-3,log10(1/2),100);

probc2 = zeros(1,100);
probc4 = zeros(1,100);
i = 1;

for f = p
        
    probc2(i) = prob_teorica(2,2,f);
    probc4(i) = prob_teorica(3,4,f) + prob_teorica(4,4,f);
    i = i + 1;

end

plot(p,probc2)
hold on 
plot(p, probc4)
hold off
grid("on");

legend('2 motores','4 motores')