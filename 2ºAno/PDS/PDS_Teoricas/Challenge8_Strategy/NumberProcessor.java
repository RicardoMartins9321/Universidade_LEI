public class NumberProcessor {
    private OperationStrategy operationStrategy;

    public NumberProcessor(OperationStrategy operationStrategy) {
        this.operationStrategy = operationStrategy;
    }

    public void setOperation(OperationStrategy operationStrategy) {
        this.operationStrategy = operationStrategy;
    }

    public int performOperation(int num1, int num2) {
        return operationStrategy.performOperation(num1, num2);
    }
}
