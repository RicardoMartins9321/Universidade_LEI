package Ex_10_3;

import java.util.ArrayList;
import java.util.List;

public class Ex_10_3 {
    public static void main(String[] args) {
        List<String> myList = new ArrayList<>();
        CommandHistory history = new CommandHistory();

        Command addCommand1 = new AddCommand<>(myList, "Teste Teste, Som Som");
        Command addCommand2 = new AddCommand<>(myList, "Bananas");
        Command addCommand3 = new AddCommand<>(myList, "Amarelas");
        Command removeCommand1 = new RemoveCommand<>(myList, "Teste Teste, Som Som");

        history.executeCommand(addCommand1);
        history.executeCommand(addCommand2);
        history.executeCommand(addCommand3);
        history.executeCommand(removeCommand1);

        System.out.println("Current list: " + myList);

        history.undoLastCommand();
        history.undoLastCommand();

        System.out.println("List after two undos: " + myList);  // Should revert to ["Teste Teste, Som Som", "Bananas", "Amarelas"]

        history.executeCommand(removeCommand1);
        System.out.println("Attempt to remove again: " + myList);  // No change expected

        history.undoLastCommand();
        System.out.println("After undo ineffective removal: " + myList);  // Still no change expected because the item was not in list
    }
}
