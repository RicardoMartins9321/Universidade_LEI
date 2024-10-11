package Ex_10_3;

import java.util.Collection;

public class AddCommand<E> implements Command {
    private Collection<E> collection;
    private E element;

    public AddCommand(Collection<E> collection, E element) {
        this.collection = collection;
        this.element = element;
    }

    @Override
    public void execute() {
        collection.add(element);
    }

    @Override
    public void undo() {
        collection.remove(element);
    }
}
