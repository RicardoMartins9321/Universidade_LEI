function H = Entropia(Texto)
    % Function: Entropia
    % Description: This function calculates the entropy of a given string 'Texto'
    %              using the Shannon entropy formula.
    % Input:
    %   - Texto: A string of characters.
    % Output:
    %   - H: Entropy value for the input string.

    % Step 1: Extract unique symbols from the input string.
    Simbolos = cell2mat(split(unique(Texto),""));

    % Step 2: Initialize entropy variable.
    H = 0;  

    % Step 3: Calculate entropy using Shannon entropy formula.
    for i = 1:length(Simbolos)
        % Calculate the frequency of the current symbol in 'Texto'.
        Frequencia = count(Texto,convertCharsToStrings(Simbolos(i)))/length(Texto);
        
        % Update entropy using the Shannon entropy formula.
        H = H + Frequencia*log2(1/Frequencia); 
    end
end