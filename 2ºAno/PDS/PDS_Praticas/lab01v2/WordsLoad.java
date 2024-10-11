package lab01v2;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

/**
 * WordSearchSolver
 */

public class WordsLoad {

    // Returns a grid with the alphabet soup
    public static char[][] LoadGrid(String file) throws IOException {
        Scanner scanFile = new Scanner(new FileReader(file));
        String firstWord = scanFile.next();
        int size = firstWord.length();
        int numberLine = 0;
        char[][] grid = new char[size][size];

        for (int i = 0; i < size; i++) {
            grid[numberLine][i] = firstWord.charAt(i);
        }
        numberLine++;
        while (scanFile.hasNext() && numberLine < size) {
            String word = scanFile.next();

            // Requisito 1. Check if the alphabet soup is a valid size square
            // size x size
            if (word.length() != size) {
                System.out.println("Tamanho da sopa de letras inválido, não forma um quadrado.");
                System.exit(-1);
            }

            for (int i = 0; i < size; i++) {
                char character1 = word.charAt(i);
                // Requisito 2,4. - Check that all the letters in the soup are composed of
                 // uppercase alphanumeric characters
                if (!Character.isUpperCase(character1)) {
                    System.out.println("Caracter invalido.");
                    System.exit(-1);
                }
                grid[numberLine][i] = character1;
            }
            numberLine++;
        }

        if (numberLine < size) {
            System.out.println("Tamanho da sopa de letras inválido, não forma um quadrado.");
            System.exit(-1);
        }

        scanFile.close();
        return grid;
    }

    // Returns a list of words to look for in the alphabet soup
    public static ArrayList<String> LoadWords(String fileName) throws IOException {
        Scanner scanFile = new Scanner(new FileReader(fileName));
        String firstWord = scanFile.next();
        int size = firstWord.length();
        ArrayList<String> listWords = new ArrayList<String>();

        // Ignore lines of chars that correspond to the soup array
        for (int i = 1; i < size; i++) {
            scanFile.next();
        }

        // Requisito 5. Check that there are no empty lines in the alphabet soup
        // not even in the word list
        while (scanFile.hasNext()) {
            String word = scanFile.next();
            if (word.length() == 0) {
                System.out.println("ERROR: Linha vazia!");
                System.exit(-1);
            }

            // Requisito 3. Check that all words in the list are not compounds
            // only uppercase alphanumeric characters
            // They must be either lowercase or mixed
            boolean wordUpper = true;
            for (int j = 0; j < word.length(); j++) {
                if (!Character.isUpperCase(word.charAt(j))) {
                    wordUpper = false;
                    break;
                }
            }
            if (wordUpper) {
                System.out.println(
                        "ERROR: Detetada linha com só maiusculas depois de terminada a matriz para a sopa de letras");
                System.exit(-1);
            }

            // Requisito 6. Check that the words in the list are separated by commas,
            // semicolons or spaces
            for (String string : word.split("[, ;]")) {
                for (int i = 0; i < string.length(); i++) {
                    if (!Character.isAlphabetic(string.charAt(i))) {
                        System.out.println("ERROR: Palavra inválida.");
                        System.exit(-1);
                    }
                }
                if (string.length() != 0) {
                    listWords.add(string);
                }
            }
        }
        scanFile.close();
        return listWords;
    }

}
