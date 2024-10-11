package Ex_10_3;

import java.util.Collection;

public class RemoveCommand<E> implements Command {
    private Collection<E> collection;
    private E element;

    public RemoveCommand(Collection<E> collection, E element) {
        this.collection = collection;
        this.element = element;
    }

    @Override
    public void execute() {
        collection.remove(element);
    }

    @Override
    public void undo() {
        collection.add(element);
    }
}

