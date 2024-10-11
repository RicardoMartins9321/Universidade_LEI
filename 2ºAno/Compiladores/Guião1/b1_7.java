import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class b1_7 {
  public static void main(String[] args) {

    System.out.print("prefix expression: ");
    Scanner reader = new Scanner(System.in);
    String input = reader.nextLine();
    reader.close();
    
    List<String> prefixTokens = Arrays.asList(input.split(" "));
    try {
      Node root = ExpressionTree.createPrefix(prefixTokens);

      System.out.print("Infix expression: ");
      ExpressionTree.printInfix(root);
      System.out.println();
      System.out.print("Postfix expression: ");
      ExpressionTree.printPostfix(root);
      System.out.println();

      System.out.println("Evaluated result: " + ExpressionTree.eval(root));
      
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
  }
}
