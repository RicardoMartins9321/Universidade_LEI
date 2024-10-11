import java.util.Arrays;
import java.util.List;
import java.util.Stack;

class ExpressionTree {
    private static List<String> operators = Arrays.asList("+", "-", "*", "/");

    public static Node createPrefix(List<String> prefixTokens) {
    Stack<Node> stack = new Stack<>();

    for (int i = prefixTokens.size() - 1; i >= 0; i--) {
        String token = prefixTokens.get(i);

        if (operators.contains(token)) {
            if (stack.size() < 2) {
                throw new IllegalArgumentException("Expressão inválida: não há operandos suficientes para o operador " + token);
            }

            Node node = new Node(token);
            node.left = stack.pop();
            node.right = stack.pop();
            stack.push(node);
        } else {
            try {
                Double.parseDouble(token);
                stack.push(new Node(token));
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Expressão inválida: o token " + token + " não é um operador válido nem um número");
            }
        }
    }

    if (stack.size() != 1) {
        throw new IllegalArgumentException("Expressão inválida: a quantidade de operadores e operandos não corresponde");
    }

    return stack.pop();
}

    public static void printInfix(Node node) {
        if (node != null) {
            printInfix(node.left);

            System.out.print(node.value + " ");

            printInfix(node.right);
        }
    }

    public static void printPostfix(Node node) {
        if (node != null) {
            printPostfix(node.left);
            printPostfix(node.right);
            System.out.print(node.value + " ");
        }
    }

    public static double eval(Node node) {
        if (node == null) {
            return 0;
        }

        if (!operators.contains(node.value)) {
            return Double.parseDouble(node.value);
        }

        double left = eval(node.left);
        double right = eval(node.right);

        switch (node.value) {
            case "+":
                return left + right;
            case "-":
                return left - right;
            case "*":
                return left * right;
            case "/":
                if (right != 0) {
                    return left / right;
                } else {
                    throw new UnsupportedOperationException("Cannot divide by zero");
                }
        }

        return 0;
    }
}