import java.util.HashMap;
import java.util.Scanner;
import java.io.File;


public class b1_4 {
  public static void main(String[] args) {

    HashMap<String,Integer> dicNums = getDic("numbers.txt");

    System.out.print("A list of numbers: ");
    Scanner reader = new Scanner(System.in);
    String input = reader.nextLine();
    String output = formatNumbers(input,dicNums);

    reader.close();
    System.out.println(output);

  }

  public static HashMap<String, Integer> getDic(String file){
    HashMap<String, Integer> dic = new HashMap<String, Integer>();

    try {
      Scanner sc = new Scanner(new File(file));
      // read the file and add the elements to the dictionary
      while (sc.hasNextLine()) {
        String line = sc.nextLine();
        String[] elements = line.split("\\W+"); // split by non-word characters (i.e. anything that is not a letter, digit or underscore)
        dic.put(elements[1], Integer.parseInt(elements[0]));
      }
      sc.close();

    } catch (Exception e) {
      System.err.format("Exception occurred trying to read '%s'.", file);
      e.printStackTrace();
      return null;
    }
    return dic;
  }

  public static String formatNumbers(String input, HashMap<String, Integer> dic){
    String[] words = input.split("\\s+|-"); // split by spaces or hyphens

    String output = "";

    for(String word : words){
      if(dic.containsKey(word)){
        output += Integer.toString(dic.get(word)) + " ";
      } else{
        output += word+" ";
      }
    }
    return output;
  }
}
