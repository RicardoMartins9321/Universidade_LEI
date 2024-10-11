%%
load("Mensagem.mat")

%simbolos1 = Alfabeto1(Mensagem);
%[simbolos2, frequencia] = Alfabeto2(Mensagem);
bits = char(NumeroBitsCodigo2(Mensagem));
fprintf("Mensagem codificada %s\n", bits)
fprintf("Número de bits da mensagem: %d\n", length(bits))

%%
load("Mensagem_v2.mat")
%[simbolos_v2, frequencia_v2] = Alfabeto2(Mensagem);
bits = char(NumeroBitsCodigo2(Mensagem));   % certo
bits2 = char(NumeroBits(Mensagem));   % errado
fprintf("Mensagem codificada %s\n", bits)
fprintf("Número de bits da mensagem_v2: %d\n", length(bits2))

%%
load("Text.mat")
%[simbolos_v2, frequencia_v2] = Alfabeto2(Mensagem);
bits2_text = char(NumeroBitsCodigo2(Text));   % certo
bits_text = char(NumeroBits(Text));   % errado
fprintf("Mensagem codificada %s\n", bits2_text)
fprintf("Número de bits do mensagem Text: %d\n", length(bits2_text))

%%
%{
Ex 3
    Ambiguity:
    
    Ambiguity refers to the potential for decoding errors due to overlapping code representations.
    In this code, the variable-length encoding is created by appending a 
    certain number of "1"s followed by a "0" for each symbol, based on its frequency.
    Since each symbol's code starts with a unique sequence of "1"s and ends
    with a "0," there is no ambiguity in decoding. Each code uniquely identifies its corresponding symbol.
    
    Instantaneity refers to the property that no code is a prefix of 
    another code, ensuring unambiguous decoding.
    In the provided code, the construction of variable-length codes ensures instantaneity.
    Each code is constructed by appending a unique sequence of "1"s, and 
    then a "0." As a result, no code is a prefix of another code, preventing ambiguity during decoding.

    In summary, the NumeroBits code is both unambiguous (free from decoding errors) 
    and instantaneous (no code is a prefix of another). The construction of
    variable-length codes based on symbol frequencies ensures a unique and 
    unambiguous representation for each symbol in the input string.

Ex 4

Time Complexity:
    The function involves a loop over the unique symbols in the input string, where 
    it calculates the frequency of each symbol and constructs a variable-length encoding.
    The time complexity is primarily determined by the length of the input 
    string and the number of unique symbols.
    Let n be the length of the input string and m be the number of unique symbols.
    The loop over symbols has a time complexity of O(m⋅n).

Space Complexity:
    Let m be the number of unique symbols. The space complexity is approximately 
    O(m) due to the dictionaries and arrays.
%}