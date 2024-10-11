function NumBits = NumeroBits(Texto)
    % Function: NumeroBits Nao usar
    % Description: This function takes a string 'Texto' as input and calculates
    %              the number of bits required to represent each symbol in the
    %              input string using a variable-length encoding based on symbol
    %              frequencies.
    % Input:
    %   - Texto: A string of characters.
    % Output:
    %   - NumBits: A string of bits representing the variable-length encoding of 'Texto'.

    % Step 1: Extract unique symbols from the input string.
    Simbolos = cell2mat(split(unique(Texto),""));

    % Step 2: Calculate the frequency of each symbol in the input string.
    Frequencia = dictionary;
    for i = 1:length(Simbolos)
        % Count occurrences of the current symbol and calculate its frequency.
        Frequencia(Simbolos(i)) = count(Texto,convertCharsToStrings(Simbolos(i)))/length(Texto);
    end
    
    % Step 3: Sort symbols based on their frequencies in descending order.
    keys = Frequencia.keys;
    values = Frequencia.values;
    [sortedValues, sortIdx] = sort(values,"descend");
    sortedKeys = keys(sortIdx);

    % Step 4: Create a variable-length encoding for each symbol.
    lettertoBits = dictionary;
    for i= 1:length(sortedKeys)
       % Construct a binary representation based on the symbol's rank.
       string = "";
       for j = 1:i
           string = append(string, "1");
       end
       string = append(string, "0");

       % Assign the binary representation to the symbol.
       lettertoBits(sortedKeys(i)) = string;
    end

    % Step 5: Encode the input string using the variable-length encoding
    NumBits = "";
    for i = 1:length(Texto)
         % Concatenate the binary representation of each symbol in 'Texto'.
        NumBits = append(NumBits, lettertoBits(Texto(i)));
    end
end