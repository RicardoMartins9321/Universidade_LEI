import java.util.Scanner;

public class b1_1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("ex formato: 2 + 2 ; 2 /n + /n 2");
        System.out.print("Digite a operação matemática: ");
        double num1 = scanner.nextDouble();
        String operador = scanner.next();
        double num2 = scanner.nextDouble();
        scanner.close();

        double resultado;
        switch (operador) {
            case "+":
                resultado = num1 + num2;
                break;
            case "-":
                resultado = num1 - num2;
                break;
            case "*":
                resultado = num1 * num2;
                break;
            case "/":
                if (num2 == 0) {
                    System.err.println("Erro: divisão por zero");
                    return;
                }
                resultado = num1 / num2;
                break;
            default:
                System.err.println("Erro: operador inválido");
                return;
        }
        System.out.println("Resultado: " + resultado);
    }
}
