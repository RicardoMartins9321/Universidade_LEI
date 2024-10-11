package Ex_10_1;

import java.util.ListIterator;
import java.util.NoSuchElementException;

public class Vector_ListIterator<T> implements ListIterator<T> {
    private int index;
    private VectorGeneric<T> vector;

    public Vector_ListIterator(VectorGeneric<T> vector, int index) {
        this.index = index;
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

    @Override
    public boolean hasPrevious() {
        return (this.index > 0);
    }

    @Override
    public T previous() {
        if (hasPrevious()) {
            return vector.getElem(--index);
        } else {
            throw new NoSuchElementException("Operation isn't supported");
        }
    }

    @Override
    public int nextIndex() {
        return this.index + 1;
    }

    @Override
    public int previousIndex() {
        return this.index - 1;
    }

    @Override
    public void remove() {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'remove'");
    }

    @Override
    public void set(T e) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'set'");
    }

    @Override
    public void add(T e) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'add'");
    }
}
