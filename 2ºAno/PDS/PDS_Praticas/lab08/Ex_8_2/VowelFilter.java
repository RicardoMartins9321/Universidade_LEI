package Ex_8_2;

public class VowelFilter extends Decorator {

    public VowelFilter(ReaderInterface reader) {
        super(reader);
    }

    @Override
    public boolean hasNext() {
        return super.hasNext();
    }

    @Override
    public String next() {
        return super.next().replaceAll("[aeiouAEIOU]", "");
    }
}
