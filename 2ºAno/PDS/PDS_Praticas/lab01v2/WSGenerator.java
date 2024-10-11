package lab01v2;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;




public class WSGenerator {

    private static int size = 0;
    private static HashSet<String> wordsSet = new HashSet<>();
    private static List<String> inputFileContents = new ArrayList<>(); // To store input file content
    private static Random random = new Random();
    private static char[][] grid;
    

    public static void main(String[] args) {
        parseArguments(args);
        if (size == 0 || wordsSet.isEmpty()) {
            System.out.println("Essential parameters missing or incorrect. Make sure to provide a valid size and input file with words.");
            System.exit(1);
        }

        // Calculate the total length of all words
        int totalChars = wordsSet.stream().mapToInt(String::length).sum();

        // Check if total characters are less than or equal to size squared
        if (totalChars > size * size) {
            System.out.println("ERROR: The combined length of all words exceeds the grid size. Please use fewer or shorter words.");
            System.exit(1);
        }

        
            
        WordSolver wordSolver =new WordSolver();
        int attempts=0;
            do {
                initializeGrid();
                placeWords();
                fillEmptySpacesWithRandomLetters();
                wordSolver.SetSolver(grid,  new ArrayList<>(wordsSet), size);
            }while (!wordSolver.Solver(true)&&((attempts++)<10));
            printGrid(getOutputWriter(args));


        // System.out.println(wordsSet); // Print the words set for debugging purposes
    }

    private static void parseArguments(String[] args) {
        if (args.length == 0) {
            System.out.println("No command-line arguments provided. Usage: java WSGenerator -i <inputfile> -s <size> [-o <outputfile>]");
            System.exit(1);
        }
        if (args.length != 4 && args.length != 6) {
            System.out.println("Invalid number of arguments.");
            System.out.println("Usage: java WSGenerator -i <inputfile> -s <size> [-o <outputfile>]");
            System.exit(1);
        }

        String inputFile = null;
        for (int i = 0; i < args.length; i += 2) {
            switch (args[i]) {
                case "-i":
                    inputFile = args[i + 1];
                    break;
                case "-s":
                    size = Integer.parseInt(args[i + 1]);
                    // Validate the size of the word search
                    if (size > 40) {
                        System.out.println("ERROR: Max size of 40x40 exceeded.");
                        System.exit(1);
                    }
                    grid = new char[size][size];
                    break;
                case "-o":
                    // Output file handling is deferred to getOutputWriter
                    break;
                default:
                    System.out.println("Unknown option: " + args[i]);
                    System.exit(1);
            }
        }

        if (inputFile != null) {
            readWordsFromFile(inputFile);
        }
    }

    private static void initializeGrid() {
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                grid[i][j] = '-'; // Initialize with '-' to indicate empty spaces
            }
        }
    }

    private static void fillEmptySpacesWithRandomLetters() {
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                if (grid[i][j] == '-') {
                    grid[i][j] = (char) ('A' + random.nextInt(26)); // Fill with a random letter
                }
            }
        }
    }

    private static void readWordsFromFile(String inputFile) {
        try (Scanner scanner = new Scanner(new File(inputFile))) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                if (line.trim().isEmpty()) {
                    System.out.println("ERROR: Cannot have empty lines in the file");
                    System.exit(1);
                }
                inputFileContents.add(line); // Store each line from the input file
                String[] splitWords = line.trim().split("\\s+|,\\s*|;\\s*");

                for (String word : splitWords) {
                    if (word.matches("[a-zA-Z]+") && word.length() > 1 && word.length() <= size) {
                        wordsSet.add(word.toUpperCase());
                    } else {
                        System.out.println("ERROR: Invalid word: " + word);
                        System.exit(1);
                    }
                }
            }
        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + e.getMessage());
            System.exit(1);
        }
    }

    private static void placeWords() {
        for (String word : wordsSet) {
            boolean placed = false;
            int attempts = 0;
            while (!placed && attempts < 50000) {
                placed = tryPlaceWord(word);
                attempts++;
            }
            if (!placed) {
                System.out.println("Failed to place word: " + word);
                System.exit(1);
            }
        }
    }

    private static boolean tryPlaceWord(String word) {
        int row = random.nextInt(size);
        int col = random.nextInt(size);
        Directions directions = Directions.values()[random.nextInt(Directions.values().length)];
        boolean reverse = random.nextBoolean(); // Decide randomly whether to reverse the word

        if (reverse) {
            word = new StringBuilder(word).reverse().toString();
        }
        if (canPlaceWord(word, row, col, directions)) {
            placeWord(word, row, col, directions);
            return true;
        }
        return false;
    }

    private static boolean canPlaceWord(String word, int row, int col, Directions directions) {
        Point coordinates=new Point(row, col);

        if (!Vector.wordIn(directions, coordinates, word, col)) {
            return false;
        }
        for (int i = 0; i < word.length(); i++) {
            int currentRow = coordinates.getX();
            int currentCol = coordinates.getY();
            if (grid[currentRow][currentCol] != '-' && grid[currentRow][currentCol] != word.charAt(i)) {
                return false;
            }
            coordinates.AddDirecion(directions);
        }
        return true;
    }

    private static void placeWord(String word, int row, int col, Directions directions) {
        Point coordinates=new Point(row, col);


        for (int i = 0; i < word.length(); i++) {
            int currentRow = coordinates.getX();
            int currentCol = coordinates.getY();
            grid[currentRow][currentCol] = word.charAt(i);
            coordinates.AddDirecion(directions);
        }

    }


    private static PrintWriter getOutputWriter(String[] args) {
        String outputFile = null;
        for (int i = 0; i < args.length; i += 2) {
            if ("-o".equals(args[i])) {
                outputFile = args[i + 1];
                break;
            }
        }

        try {
            return (outputFile != null) ? new PrintWriter(outputFile) : new PrintWriter(System.out);
        } catch (FileNotFoundException e) {
            System.out.println("Error writing to file: " + e.getMessage());
            System.exit(1);
            return null; // This will never reach due to System.exit
        }
    }

    private static void printGrid(PrintWriter writer) {
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                writer.print(grid[i][j]);
            }
            writer.println();
        }
        appendInputFileContents(writer);  // Append the original file content after printing the grid
        writer.close();
    }

    // Add a new method to append inputFileContents to the output
    private static void appendInputFileContents(PrintWriter writer) {
        boolean isFirstLine = true;
        for (String line : inputFileContents) {
            if (!isFirstLine) {
                writer.println(); // Print a newline before each line except the first
            } else {
                isFirstLine = false;
            }
            writer.print(line); // Use print() here to avoid automatically appending a newline
        }
    }
}

