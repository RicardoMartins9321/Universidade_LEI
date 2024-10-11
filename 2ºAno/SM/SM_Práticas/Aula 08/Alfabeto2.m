function [Simbolos, frequencia] = Alfabeto2(Texto)
    % Function: Alfabeto2
    % Description: This function takes a string 'Texto' as input and computes
    %              the frequency of each unique symbol in the input string.
    % Input:
    %   - Texto: A string of characters.
    % Output:
    %   - Simbolos: A vector of characters containing unique symbols from 'Texto'.
    %   - frequencia: A vector of frequencies corresponding to each symbol.
    
    % Using 'unique' to get unique elements in 'Texto'
    % Using 'split' to split the unique elements into individual characters
    % and converting the resulting cell array to a character array using 'cell2mat'.
    % Note: The use of '' as the delimiter in 'split' indicates that each
    % character in 'uniqueSymbols' will be treated as a separate element.
    Simbolos = cell2mat(split(unique(Texto),""));

    % Looping through each unique symbol to compute its frequency.
    for t= 1:length(Simbolos)
        % Using 'count' to count occurrences of the current symbol in 'Texto'.
        symbolCount = count(Texto, Simbolos(t));
        
        % Calculating the frequency of the current symbol.
        frequencia(t) = symbolCount / length(Texto);

        % Displaying the symbol and its frequency as a percentage.
        fprintf("%c aparece %f%s das vezes \n ", Simbolos(t), frequencia(t)*100, "%");
    end
end