% -- lim = markov_steady_state (T)
%
% Calcula a probabilidade limite de uma matriz de transição de Markov.
%
% João Ferreira, 2022, 2023, 2024.

function lim = markov_steady_state(T)
    M = [T - eye(length(T));
         ones(1, length(T))];

    x = ones(length(M), 1);

    lim = M\x;
end
