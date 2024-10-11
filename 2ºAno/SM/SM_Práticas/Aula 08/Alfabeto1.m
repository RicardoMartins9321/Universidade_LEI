function Simbolos = Alfabeto1(Texto)
    % Function: Alfabeto1
    % Description: This function takes a string 'Texto' as input and returns
    %              a unique set of symbols present in the input string.
    % Input:
    %   - Texto: A string of characters.
    % Output:
    %   - Simbolos: A vector of characters containing unique symbols from 'Texto'.

    % Using 'unique' to get unique elements in 'Texto'
    % Using 'split' to split the unique elements into individual characters
    % and converting the resulting cell array to a character array using 'cell2mat'
    % Note: The use of '' as the delimiter in 'split' indicates that each
    % character in 'uniqueSymbols' will be treated as a separate element.

    Simbolos = cell2mat(split(unique(Texto),""));
end