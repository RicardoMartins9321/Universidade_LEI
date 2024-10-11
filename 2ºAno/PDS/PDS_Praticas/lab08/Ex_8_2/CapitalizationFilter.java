package Ex_8_2;

public class CapitalizationFilter extends Decorator {

    public CapitalizationFilter(ReaderInterface reader) {
        super(reader);
    }

    @Override
    public boolean hasNext() {
        return super.hasNext();
    }

    @Override
    public String next() {
        String str = super.next().toLowerCase();
        if (str.length() > 1) {
            return Character.toUpperCase(str.charAt(0)) + str.substring(1, str.length() - 1) +
                   Character.toUpperCase(str.charAt(str.length() - 1));
        }
        return str.toUpperCase();
    }
}
