package Ex_8_2;


public class NormalizationFilter extends Decorator {

    public NormalizationFilter(ReaderInterface reader) {
        super(reader);
    }

    @Override
    public boolean hasNext() {
        return super.hasNext();
    }

    public String next() {
        String nextString = super.next();
        String normalizedString = java.text.Normalizer.normalize(nextString, java.text.Normalizer.Form.NFD);
        return normalizedString.replaceAll("\\p{Punct}", "").replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
    }
}
