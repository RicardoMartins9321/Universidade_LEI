package Ex_10_1;

public interface Vector<T> {
    public java.util.ListIterator<T> listIterator();
    public java.util.ListIterator<T> listIterator(int index);
    public java.util.Iterator<T> Iterator();
}
