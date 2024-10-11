import java.util.HashMap;
import java.util.Scanner;
import java.io.File;


public class b1_6 {
  public static void main(String[] args) {
    if (args.length < 2) {
      System.out.println("Usage: java b1_6 <fileDic> <fileText>");
      System.exit(1);
    }

    HashMap<String,String> dictionaire = new HashMap<String,String>();

    try {
      Scanner sc = new Scanner(new File(args[0]), "UTF-8");

      while (sc.hasNextLine()) {
        String line = sc.nextLine();
        String[] elements = line.split("\\s+", 2);
        dictionaire.put(elements[0], elements[1]);
      }
      sc.close();

    } catch (Exception e) {
      System.err.format("Exception occurred trying to read");
      e.printStackTrace();
      System.exit(1);
    }

    for (int i = 1; i < args.length; i++) {
      try {
        Scanner sc = new Scanner(new File(args[i]), "UTF-8");
        while (sc.hasNextLine()) {
          String sentence = sc.nextLine();
          System.out.println(translateSentence(sentence, dictionaire));
        }
        sc.close();
      } catch (Exception e) {
        System.err.format("Exception occurred trying to read");
        e.printStackTrace();
        System.exit(1);
      }
    }
  }

  public static String translateSentence(String sentence, HashMap<String,String> dictionaire) {
    String[] words = sentence.split(" ");
    String translated = "";
    /*for (String word : words) {
      if (dictionaire.get(word) == null) {
        translated += word + " ";
        continue;
      } else {translated += dictionaire.get(word) + " ";}
    } igual ao que está em baixo*/
    for (String word : words) {
      translated += dictionaire.getOrDefault(word, word) + " ";
    }
    return translated.trim();
  }
}
