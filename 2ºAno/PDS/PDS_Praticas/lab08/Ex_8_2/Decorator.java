package Ex_8_2;

public class Decorator implements ReaderInterface {
    ReaderInterface reader;

    public Decorator(ReaderInterface reader) {
        this.reader = reader;
    }

    @Override
    public boolean hasNext() {
        return reader.hasNext();
    }

    @Override
    public String next() {
        return reader.next();
    }

}
