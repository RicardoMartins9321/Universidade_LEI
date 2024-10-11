function [NumBits, NumBPS] = GeraMensagem(f, CompMesg, nBits)
    % Verifica se os vetores de entrada têm o mesmo tamanho
    if numel(f) ~= numel(nBits)
        error('Os vetores de frequências e de número de bits devem ter o mesmo tamanho.');
    end

    % Número total de símbolos
    N = numel(f);

    % Gera a mensagem aleatória
    mensagem = zeros(CompMesg, 1);
    for i = 1:CompMesg
        % Gera um número aleatório ponderado pelas probabilidades em f
        r = rand();
        cumulativeProb = 0;
        for j = 1:N
            cumulativeProb = cumulativeProb + f(j);
            if r <= cumulativeProb
                mensagem(i) = j; % Armazena o índice do símbolo escolhido
                break;
            end
        end
    end

    % Calcula o número total de bits e o número médio de bits por símbolo
    NumBits = sum(nBits(mensagem));
    NumBPS = NumBits / CompMesg;
end

