package lab01v2;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;


public class WordSearchSolver {



    public static void main(String[] args) throws IOException {
      File fileSoup = null;
      //String fileName = null;
      int size = 0;

      // Checks if the user entered the file name
      if (args.length != 1) {
        System.out.println("Usage: java lab01/WSSolver lab01/<filename>");
        System.exit(1);
      }

      // Try reading the file
      try {
        // Checks if the file exists
        fileSoup = new File(args[0]);
        //fileName = args[0].replaceAll(".txt", "");

        Scanner fileScanner = new Scanner(fileSoup);
        size = fileScanner.nextLine().length();       // Tamanho da sopa de letras
        fileScanner.close();
      } catch (Exception e) {
        // If you cannot read the file, terminate the program
        System.out.println("ERROR: Ficheiro inválido ou inexistente.");
        System.exit(1);
      }

      // Checks if the alphabet soup size is valid
      if (size > 40) {
        System.out.println("ERROR: O tamanho da sopa de letras é inválido. O tamanho máximo é 40x40.");
        System.exit(1);
      }

        char[][] matrix = WordsLoad.LoadGrid(args[0]);
        ArrayList<String>words= WordsLoad.LoadWords( args[0]);
        WordSolver wordSolver =new WordSolver(matrix, words, size);
        wordSolver.Solver(false);
  }


}
