package Ex_10_3;

import java.util.Stack;

public class CommandHistory {
    private Stack<Command> history = new Stack<>();

    public void executeCommand(Command command) {
        command.execute();
        history.push(command);
    }

    public void undoLastCommand() {
        if (!history.isEmpty()) {
            Command lastCommand = history.pop();
            lastCommand.undo();
        }
    }

    public void clearHistory() {
        history.clear();
    }
}
