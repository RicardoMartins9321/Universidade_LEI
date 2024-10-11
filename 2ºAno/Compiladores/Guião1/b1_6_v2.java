import java.util.HashMap;
import java.util.Scanner;
import java.io.File;

public class b1_6_v2 {
  public static void main(String[] args) {
    if (args.length < 1) {
      System.out.println("Please provide the dictionary file as the first argument.");
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
    for (String word : words) {
      translated += translateWord(word, dictionaire) + " ";
    }
    return translated.trim();
  }

  public static String translateWord(String word, HashMap<String,String> dictionaire) {
    if (dictionaire.containsKey(word)) {
      String[] words = dictionaire.get(word).split(" ");
      String translated = "";
      for (String w : words) {
        translated += translateWord(w, dictionaire) + " ";
      }
      return translated.trim();
    } else {
      return word;
    }
  }
}