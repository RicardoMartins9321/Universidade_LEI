import java.util.Scanner;
import java.util.Stack;

public class b1_3 {
  public static void main(String[] args) {

    Stack<Double> numbersStack = new Stack<>();

    double num1;
    double num2;
    double result = 0;

    System.out.println("Calculadora usando Reverse polish notation, ex formato: 1 2 3 * +");
    System.out.print("Digite a expressão matemática: ");

    Scanner scannerArgs = new Scanner(System.in);
    String arguments = scannerArgs.nextLine();
    scannerArgs.close();

    Scanner interpreter = new Scanner(arguments);

    // enquanto houverem números, adicionar à pilha
    while(interpreter.hasNextDouble()){
        numbersStack.add(interpreter.nextDouble());
        System.out.println("Stack: " + numbersStack.toString());
    }

    // Sempre que haja um operador e pelo menos 2 números na pilha, retirar os 2 números e aplicar a operação
    while(interpreter.hasNext() && numbersStack.size() >= 2){
      num2 = numbersStack.pop();
      num1 = numbersStack.pop();

      String op = interpreter.next().trim();

      switch(op){
        case "+":
          result = num1+num2;
          break;
        case "-":
          result = num1-num2;
          break;
        case "*":
          result = num1*num2;
          break;
        case "/":
          result = num1/num2;
          break;
        default:
          System.err.println("ERROR: The given operation is not valid");
          System.exit(1);
      }

      // colocar o resultado na pilha
      numbersStack.add(result);
      System.out.println("Stack: " + numbersStack.toString());

    }

    interpreter.close();

  }
}
