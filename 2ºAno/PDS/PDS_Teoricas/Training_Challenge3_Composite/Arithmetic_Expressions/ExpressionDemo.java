package Arithmetic_Expressions;

// Component
interface Expression {
    int evaluate();
}

// Leaf
class Number implements Expression {
    private int value;

    public Number(int value) {
        this.value = value;
    }

    public int evaluate() {
        return value;
    }
}

// Composite
class Addition implements Expression {
    private Expression leftOperand;
    private Expression rightOperand;

    public Addition(Expression left, Expression right) {
        this.leftOperand = left;
        this.rightOperand = right;
    }

    public int evaluate() {
        return leftOperand.evaluate() + rightOperand.evaluate();
    }
}

// Composite
class Multiplication implements Expression {
    private Expression leftOperand;
    private Expression rightOperand;

    public Multiplication(Expression left, Expression right) {
        this.leftOperand = left;
        this.rightOperand = right;
    }

    public int evaluate() {
        return leftOperand.evaluate() * rightOperand.evaluate();
    }
}

// Client
public class ExpressionDemo {
    public static void main(String[] args) {
        Expression expr = new Addition(new Number(1), new Multiplication(new Number(2), new Number(3)));
        System.out.println("The result is: " + expr.evaluate());
    }
}

