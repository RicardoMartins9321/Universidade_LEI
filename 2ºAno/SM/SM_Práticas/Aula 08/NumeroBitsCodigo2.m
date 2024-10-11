function NumBits = NumeroBitsCodigo2(Texto)
    % Função: NumeroBitsCodigo2
    % Descrição: Esta função determina o número de bits necessário para
    % representar a mensagem de texto usando um código binário especial.
    % Cada símbolo tem um número de bits igual ao seu índice, exceto o
    % último bit que é sempre 0.
    % Entrada:
    %   - Texto: Uma string de caracteres.
    % Saída:
    %   - NumBits: Número total de bits necessários para representar o texto.

    % Obter os símbolos e as suas frequências usando a função Alfabeto2
    [Simbolos, Frequencia] = Alfabeto2(Texto);

    % Ordenar os símbolos por ordem decrescente de frequência
    [~, sortedIdx] = sort(Frequencia, 'descend');
    Simbolos = Simbolos(sortedIdx);

    % Criar um código binário especial baseado na ordem decrescente de frequência
    lettertoBits = containers.Map;
    for i = 1:length(Simbolos)
        bits = repmat('1', 1, i-1);
        bits = strcat(bits, '0');
        lettertoBits(Simbolos(i)) = bits;
    end

    % Codificar a mensagem usando o código binário especial
    NumBits = '';
    for i = 1:length(Texto)
        NumBits = strcat(NumBits, lettertoBits(Texto(i)));
    end
end