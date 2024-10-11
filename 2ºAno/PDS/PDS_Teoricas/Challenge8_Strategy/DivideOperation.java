class DivideOperation implements OperationStrategy {
    @Override
    public int performOperation(int num1, int num2) {
        if (num2 == 0) {
            throw new ArithmeticException("Division by zero");
        }
        return num1 / num2;
    }
}