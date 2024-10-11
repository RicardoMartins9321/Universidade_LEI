function array = randStringArray(N, i_min, i_max, chars, prob_chars)
    % Initialize cell array to store generated strings
    array = cell(1, N);
    
    % Use a map for faster membership check
    generatedStrings = containers.Map;

    % Loop to generate N random strings
    for i = 1:N
        % Generates a random length for the string between i_min and i_max
        size = randi([i_min, i_max]);

        % Generate a random string based on the number of input arguments
        if nargin == 4
            string = generateRandomString(size, chars);
        elseif nargin == 5
            string = generateRandomString(size, chars, prob_chars);
        else
            error('Invalid number of input arguments.');
        end

        % Check if the generated string already exists in the map
        while isKey(generatedStrings, string)
            % Generate a new string until it is unique
            if nargin == 4
                string = generateRandomString(size, chars);
            elseif nargin == 5
                string = generateRandomString(size, chars, prob_chars);
            end
        end

        % Add the generated string to the map
        generatedStrings(string) = true;
        
        % Place the generated string in the cell array
        array{i} = string;
    end
end

function str = generateRandomString(size, chars, prob_chars)
    % Function to generate a random string based on the number of input arguments
    if nargin == 2
        charIndices = randi([1, length(chars)], 1, size);
        str = chars(charIndices);
    elseif nargin == 3
        prob_chars = prob_chars / sum(prob_chars);
        charIndices = randsample(1:length(chars), size, true, prob_chars);
        str = chars(charIndices);
    else
        error('Invalid number of input arguments.');
    end
end


 