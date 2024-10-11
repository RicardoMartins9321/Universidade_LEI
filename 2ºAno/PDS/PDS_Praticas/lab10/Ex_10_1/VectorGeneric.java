package Ex_10_1;

public class VectorGeneric<T> implements Vector<T>{
    private final static int ALLOC = 50;
    private int dimVec = ALLOC;
    private int nElem;
    private T[] vec;

    @SuppressWarnings("unchecked")
    public VectorGeneric() {
        nElem = 0;
        vec = (T[]) new Object[dimVec];
    }

    public boolean addElem(T elem) {
        if (elem == null)
            return false;

        ensureSpace();
        vec[nElem++] = elem;
        return true;
    }

    private void ensureSpace() {
        if (nElem>=dimVec) {
            dimVec += ALLOC;
            @SuppressWarnings("unchecked")
            T[] newArray = (T[]) new Object[dimVec];
            System.arraycopy(vec, 0, newArray, 0, nElem );
            vec = newArray;
        }
    }

    public T getElem(int i) {
        return (T) vec[i];
    }

    public int totalElem() {
        return nElem;
    }

    public boolean removeElem(T elem) {
        for (int i = 0; i < nElem; i++) {
            if (vec[i].equals(elem)) {
                if (nElem-i-1 > 0) // not last element
                System.arraycopy(vec, i+1, vec, i, nElem-i-1 );
                vec[--nElem] = null; // libertar último objecto para o GC
                return true;
            }
        }
        return false;
    }


    @Override
    public java.util.ListIterator<T> listIterator() {
        return new Vector_ListIterator<T>(this, 0);
    }

    @Override
    public java.util.ListIterator<T> listIterator(int index) {
        return new Vector_ListIterator<T>(this, index);
    }

    @Override
    public java.util.Iterator<T> Iterator() {
        return new VectorIterator<T>(this);
    }
}
