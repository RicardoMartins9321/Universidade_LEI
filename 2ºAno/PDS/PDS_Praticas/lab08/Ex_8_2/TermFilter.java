package Ex_8_2;

public class TermFilter extends Decorator {
    private String[] words;
    private int index = 0;

    public TermFilter(ReaderInterface reader) {
        super(reader);
    }

    @Override
    public boolean hasNext() {
        if (words != null && index < words.length) {
            return true;
        }
        if (super.hasNext()) {
            words = super.next().split("\\s+");
            index = 0;
            return hasNext();
        }
        return false;
    }

    @Override
    public String next() {
        return words[index++];
    }
}
