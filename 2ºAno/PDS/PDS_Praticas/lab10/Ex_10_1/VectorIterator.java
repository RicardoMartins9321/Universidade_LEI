package Ex_10_1;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class VectorIterator<T> implements Iterator<T> {
    private int index;
    private VectorGeneric<T> vector;

    public VectorIterator(VectorGeneric<T> vector) {
        this.index = 0;
        this.vector = vector;
    }

    @Override
    public boolean hasNext() {
        return (this.index < vector.totalElem());
    }

    @Override
    public T next() {
        if (hasNext()) {
            return vector.getElem(index++);
        } else {
            throw new NoSuchElementException("Operation isn't supported");
        }
    }
}
