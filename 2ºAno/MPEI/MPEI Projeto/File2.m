fprintf("Loading Variables....")
load('myVariables.mat');
fprintf("Done\n")

while (true)
    printMenu
    user_option_str = input("", "s");
    user_option = str2double(user_option_str);     % Convert string input to number
    
    % Check if the conversion was successful and the number is within the valid range
    if isnan(user_option) || ~ismember(user_option, 1:6)
        fprintf("\n--------------------------------------------------------------------------\n");
        fprintf("Invalid input, please enter a number between 1 and 6.\n");
        fprintf("--------------------------------------------------------------------------\n");
    else
        switch user_option
            case 1
                disp("\n----------------- Available Genres ---------------------")
                for n = 1:numGenres
                    disp(uniqueGenres{n})
                end
                fprintf("--------------------------------------------------------------------------\n");
            case 2
                fprintf("\n--------------------------------------------------------------------------\n");
                genre = strtrim(input("Select a genre: ", "s"));
                if ~ismember(genre, uniqueGenres)
                    disp("Invalid genre, please write a valid genre!")
                else                                
                    moviesByGenre = pertenceConjunto(genreFilter, genre, numHashFuncGenre);
    
                    fprintf("Estimated number of films in genre '%s': %d\n", genre, moviesByGenre);  
                end
                fprintf("--------------------------------------------------------------------------\n");
            case 3
                fprintf("\n--------------------------------------------------------------------------\n");
                inputParts = split(input("Select a genre and a year (separated by ','): ", "s"), ',');
                genre = strtrim(inputParts{1});
                year = str2double(strtrim(inputParts{2}));
                if ~ismember(year, uniqueYears)
                    fprintf("ERROR: Must use a valid year from %d to %d\n", min(uniqueYears), max(uniqueYears));
                    fprintf("There are no movies from the year: %d\n", year)
                elseif ~ismember(genre, uniqueGenres)
                    disp("Invalid genre, please write a valid genre!")
                else
                    moviesByGenreYear = pertenceConjuntoAno(genreYearFilter, genre, year, numHashFuncGenreYear);
                    fprintf("Estimated number of films in genre '%s' and year '%d': %d\n", genre, year, moviesByGenreYear);  
                end
                fprintf("--------------------------------------------------------------------------\n");            
            case 4
                title = lower(input("Insert a string: ", "s"));

                while (length(title) < shingleSize)
                    fprintf('Write a minimum of %d characters\n', shingleSize);
                    title = lower(input('Insert a string: ', 's'));
                end
                
                fprintf("\n------------------------ MOST SIMILAR TITLES ---------------------------\n");
    
                searchTitle(title, matrizMinHashTitles, numHash, titles, shingleSize); 
    
                fprintf("--------------------------------------------------------------------------\n");
    
                
            case 5
                while true
                    % Prompt the user to enter one or more genres, separated by commas
                    user_input = input("Select one or more genres (separated by ','): ", "s");
                
                    % Split the input into individual genres and trim whitespace
                    user_genres = strtrim(split(user_input, ","));
                
                    % Check if all entered genres are valid
                    if all(ismember(user_genres, uniqueGenres))
                        break; % Exit the loop if all genres are valid
                    else
                        % Inform the user about the invalid entry
                        fprintf("Invalid input. Please ensure all genres are valid.\n");
                    end
                end                   
            case 6
                fprintf("Exited the program\n");
                break;
        end
    end
    fprintf("\n");
end


function printMenu()
    disp("1 - Display available genres ")
    disp("2 - Number of movies of a genre")
    disp("3 - Number of movies of a genre on a given year")
    disp("4 - Search movie titles")
    disp("5 - Search movies based on genres")
    disp("6 - Exit")
    fprintf("Select an option: ")
end
