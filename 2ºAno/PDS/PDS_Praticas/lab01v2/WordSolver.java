package lab01v2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class WordSolver {
    private char[][] grid;
    private ArrayList<String> listWordsOriginal;
    private int sizeGrid;
    private Map<String, ArrayList<Vector>> PointsOfWordsFund;
    private Set<String> listWords;
    private boolean validToStartSolver;

    public WordSolver(char[][] grid, ArrayList<String> listWordsOriginal, int sizeGrid) {
        this.grid = grid;
        this.listWordsOriginal = listWordsOriginal;
        this.sizeGrid = sizeGrid;
        listWords = new HashSet<>(listWordsOriginal);
        PointsOfWordsFund = new HashMap<>();
        for (String string : listWords) {
            PointsOfWordsFund.put(string, new ArrayList<Vector>());
        }
        validToStartSolver=true;
    }

    public WordSolver() {
        validToStartSolver=false;
    }
    public  boolean Solver(boolean IsToGenerator) {
        if (!validToStartSolver) {
            System.err.println("ERROR: Não foram passados dados nem no construtor, nem no SetSolver.");
            System.exit(1);
        }
        // x is vetrical axis and y is horizontal axis
        // axis is beteewn in 0 at sizeGrid-1
        for (int x = 0; x < sizeGrid; x++) {
            for (int y = 0; y < sizeGrid; y++) {
                for (String word : listWords) {
                    if (grid[x][y] == Character.toUpperCase(word.charAt(0))) {
                        testSolverWord(x, y, word);
                    }
                }

            }
        }
        // Requisito 8
        for (String word : listWords) {
            ArrayList<Vector> vectors = PointsOfWordsFund.get(word);
            for (Vector vector : vectors) {
                removeVectorsInSubWords(word, vector.getDirection(), vector);
            }
        }

        // Requesito 7

        for (String word : listWordsOriginal) {
            if (PointsOfWordsFund.get(word).size() != 1) {
                if (!IsToGenerator) {
                    System.err.println("ERROR: Um palavra que não tem uma e somente uma existacia.");
                    System.exit(1);
                }
                return false;
            }
        }
        printOutput();
        return true;
    }

    private  void testSolverWord(int x, int y, String word) {
        Point coordinates = new Point(x, y);
        for (Directions direction : Directions.values()) {
            if (Vector.wordIn(direction, coordinates, word, sizeGrid)
                    && checkWordPropagation(direction, new Point(coordinates), word)) {
                PointsOfWordsFund.get(word).add(new Vector(direction, coordinates, word.length()));

            }
        }
    }

    private  void removeVectorsInSubWords(String word, Directions direction,Point coordinates) {
        Map<String, Integer> mapSubWordsIndexInWord = checkIfWordHaveSubString(word);
        if (mapSubWordsIndexInWord.size() != 0) {
            RemovePoint(direction, coordinates,mapSubWordsIndexInWord);
        }
    }

    private  Map<String, Integer> checkIfWordHaveSubString(String word) {
        Map<String, Integer> mapSubWordsIndexInWord = new HashMap<>();
        for (String string : listWords) {
            if (string.equals(word)) {
                continue;
            }
            int indexOfSubWords = word.toLowerCase().indexOf(string.toLowerCase());
            if (indexOfSubWords != -1) {
                mapSubWordsIndexInWord.put(string, indexOfSubWords);
            }
        }

        return mapSubWordsIndexInWord;
    }

    private  void RemovePoint(Directions direction, Point point, Map<String, Integer> mapSubWordsIndexInWord) {
        for (Map.Entry<String, Integer> entry : mapSubWordsIndexInWord.entrySet()) {
            String word = entry.getKey();
            Integer indexOfSubWord = entry.getValue();
            Vector movePointer = new Vector(direction, indexOfSubWord);
            Point pointer = Vector.SumPointVector(movePointer, point);
            Point.removeExtraVector(PointsOfWordsFund.get(word), pointer);
        }
    }

    private  boolean checkWordPropagation( Directions direction, Point point, String word) {
        for (int index = 1; index < word.length(); index++) {
            point.AddDirecion(direction);
            if (grid[point.getX()][point.getY()] != Character.toUpperCase(word.charAt(index))) {
                return false;
            }
        }
        return true;
    }

    private  void printOutput() {
        char[][] gridSolve = initializeGrid();
        //array to store words so that they are not repeated but maintain the original order
        ArrayList<String> PrintWords = new ArrayList<>();
        for (String string : listWords) {
            if (!PrintWords.contains(string)) {
                Vector vector = PointsOfWordsFund.get(string).get(0);
                System.out.printf("%-15s %s\n", string.toLowerCase(), vector);
                gridPutWord(gridSolve, new Vector(vector), string);
                PrintWords.add(string);
            }

        }
        System.out.println();
        for (char[] line : gridSolve) {
            for (char character : line) {
                System.out.printf("%c ", character);
            }
            System.out.println();
        }
    }

    private  char[][] initializeGrid() {
        char[][] outGrid = new char[sizeGrid][sizeGrid];
        for (int x = 0; x < sizeGrid; x++) {
            for (int y = 0; y < sizeGrid; y++) {
                outGrid[x][y] = '.';
            }
        }
        return outGrid;
    }

    private  boolean gridPutWord(char[][] outGrid, Vector vector, String word) {
        for (int index = 0; index < word.length(); index++) {
            outGrid[vector.getX()][vector.getY()] = Character.toUpperCase(word.charAt(index));
            vector.AddDirecion(vector.getDirection());
        }
        return true;
    }

    public void SetSolver(char[][] grid, ArrayList<String> listWordsOriginal, int sizeGrid) {
        this.grid = grid;
        this.listWordsOriginal = listWordsOriginal;
        this.sizeGrid = sizeGrid;
        listWords = new HashSet<>(listWordsOriginal);
        PointsOfWordsFund = new HashMap<>();
        for (String string : listWords) {
            PointsOfWordsFund.put(string, new ArrayList<Vector>());
        }
        validToStartSolver=true;
    }
}
