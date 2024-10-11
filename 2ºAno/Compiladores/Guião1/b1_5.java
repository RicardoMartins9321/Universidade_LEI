import java.util.HashMap;
import java.util.Scanner;


public class b1_5 {
  public static void main(String[] args) {

    HashMap<String,Integer> dicNums = b1_4.getDic("numbers.txt");

    System.out.print("The number string: ");
    Scanner reader = new Scanner(System.in);
    String input = reader.nextLine();

    // format the numbers and print the result
    // This line of code calls the formatNumbers function, passing in the input string and
    // the dicNums HashMap as arguments. The formatNumbers function replaces words in the
    // input string with their corresponding numeric values from the dicNums HashMap. The
    // resulting string is then processed further using the replaceAll method, which
    // removes all non-digit characters except spaces. Finally, the string is split into
    // an array of substrings using the split method, with the delimiter being one or more
    // consecutive whitespace characters. The resulting array, numbers, contains the
    // formatted numeric values extracted from the input string.
    String[] numbers = b1_4.formatNumbers(input, dicNums).replaceAll("[\\D]", " ").split("\\s+");

    int tempNum = Integer.parseInt(numbers[0]);
    int result = 0;

    for(int i=0; i < numbers.length; i++){
      if(i == numbers.length-1){
        result += tempNum;
        continue;
      }
      if(Integer.parseInt(numbers[i]) < Integer.parseInt(numbers[i+1])){
        tempNum *= Integer.parseInt(numbers[i+1]);
        continue;
      }
      result += tempNum;
      tempNum = Integer.parseInt(numbers[i+1]);

    }
    System.out.println("Resultado: " + result);
    reader.close();
  }
}
