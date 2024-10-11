
prob = zeros(1,21);
p = 1/2;
numLancamentos = 20;
numExperiencias = 1e5;

for numCaras = 0:20
    prob(numCaras+1) = probSimulacao(p,numLancamentos,numCaras,numExperiencias);
end

stem(0:20, prob)
xlabel("numCaras")
ylabel("Probabilidade")

function [prob] = probSimulacao(p,numLancamentos,numCaras,numExperiencias)
    lancamentos = rand(numLancamentos, numExperiencias) < p;
    sucessos = sum(lancamentos) == numCaras;
    prob = sum(sucessos)/numExperiencias;
end

%% Function 
function probabilidade = estimaProbabilidade(p,numLancamentos,numCaras,numExperiencias)
    % Inicializar o contador de sucessos
    contSucessos = 0;

    % Executar numExperiencias vezes
    for i = 1:numExperiencias
        % Gerar numLancamentos números aleatórios entre 0 e 1
        lancamentos = rand(1, numLancamentos);

        % Contar o número de 'caras' (valores <= p)
        numCarasObtidas = sum(lancamentos <= p);

        % Se o número de 'caras' é igual ao desejado, incrementar o contador de sucessos
        if numCarasObtidas == numCaras
            contSucessos = contSucessos + 1;
        end
    end

    % Calcular a probabilidade como o número de sucessos dividido pelo número de experiências
    probabilidade = contSucessos / numExperiencias;
end