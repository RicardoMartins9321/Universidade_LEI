import java.util.ArrayList;
import java.util.List;

public class Document {
    private final String title;
    private final List<String> paragraphs;

    private Document(Builder builder) {
        this.title = builder.title;
        this.paragraphs = builder.paragraphs;
    }

    public String getTitle() {
        return title;
    }

    public List<String> getParagraphs() {
        return paragraphs;
    }

    public static class Builder {
        private String title;
        private List<String> paragraphs = new ArrayList<>();

        public Builder setTitle(String title) {
            this.title = title;
            return this;
        }

        public Builder addParagraph(String paragraph) {
            this.paragraphs.add(paragraph);
            return this;
        }

        public Document build() {
            return new Document(this);
        }
    }
}

// Usage:
public class Main {
    public static void main(String[] args) {
        Document document = new Document.Builder()
                .setTitle("Sample Document")
                .addParagraph("This is the first paragraph.")
                .addParagraph("This is the second paragraph.")
                .build();

        System.out.println("Title: " + document.getTitle());
        System.out.println("Paragraphs: " + document.getParagraphs());
    }
}
