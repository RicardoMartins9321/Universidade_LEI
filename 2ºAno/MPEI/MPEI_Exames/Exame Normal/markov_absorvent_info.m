% -- cs = markov_absorvent_info (T)
%
% Transforma a matriz «T» de Markov na sua forma canónica e cálcula as
% restantes matrizes relacionadas (Q, R, F, B) e o tempo médio até absorção.
%
% PARÂMETROS:
%   - T: a matriz de Markov.
%
% DEVOLVE:
%    - cs: estrutura com os seguintes campos:
%        - C: a matriz T na sua forma canónica;
%        - Q: submatriz de C, com o quadrante transiente->transiente.
%        - R: submatriz de C, com o quadrante transiente->absorvente.
%        - F: a matriz fundamental;
%        - B(i, j): probabilidade de absorção em i quando começado em j;
%        - avg_time_until_absorption(j): tempo médio até absorção quando
%               começado em j;
%        - tr_states: lista com os estados transientes da matriz T original;
%        - abs_states: lista com os estados absorventes da matriz T original;
%
% Autor: João Ferreira, 2024.
% Domínio público.

function cs = markov_absorvent_info (T)
    all_states = 1:length(T);
    absorvent = [];

    for i = all_states
        if (T(i, i) == 1)
            absorvent = [absorvent i]; %#ok<AGROW>
        end
    end

    transient = setxor(absorvent, all_states);


    shuffle_key = [transient absorvent];
    canon(:, :) = T(shuffle_key, shuffle_key);

    c_transient = 1 : length(transient);
    c_absorvent = length(transient)+1 : length(canon);

    Q = canon(c_transient, c_transient);
    R = canon(c_absorvent, c_transient);

    if (isempty(absorvent))
        warning("Markov matrix had no absorvent states.")
        F = [];
        B = [];
        avg_time_until_absorption = inf(length(absorvent));
    else
        IminusQ = eye(length(Q)) - Q;
        F = inv(IminusQ);
        B = R / IminusQ;    % equivalente a R*F.
        avg_time_until_absorption = sum(F);
    end

    cs.C = canon;   % A forma canónica da matriz T.
    cs.Q = Q;   % Submatriz de C, com o quadrante transiente->transiente.
    cs.R = R;   % Submatriz de C, com o quadrante transiente->absorvente.
    cs.F = F;   % Matriz fundamental.
    cs.B = B;   % B(x, y): probabilidade de absorção em x quando começa em y.
    cs.avg_time_until_absorption = avg_time_until_absorption;
    cs.tr_states = transient;
    cs.abs_states = absorvent;

    % chave usada para permutar as colunas (e linhas) da matriz T.
    % cs.shuffle_key = shuffle_key;
end
