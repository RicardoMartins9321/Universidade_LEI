public interface Document {
    void open();
    void save();
    void close();
}

public class TextDocument implements Document {
    public void open() {
        System.out.println("Text Document Opened.");
    }

    public void save() {
        System.out.println("Text Document Saved.");
    }

    public void close() {
        System.out.println("Text Document Closed.");
    }
}

public class SpreadsheetDocument implements Document {
    public void open() {
        System.out.println("Spreadsheet Document Opened.");
    }

    public void save() {
        System.out.println("Spreadsheet Document Saved.");
    }

    public void close() {
        System.out.println("Spreadsheet Document Closed.");
    }
}

public abstract class DocumentCreator {
    public abstract Document createDocument(String type);
}

public class MyDocumentCreator extends DocumentCreator {
    public Document createDocument(String type) {
        if (type.equalsIgnoreCase("TEXT")) {
            return new TextDocument();
        } else if (type.equalsIgnoreCase("SPREADSHEET")) {
            return new SpreadsheetDocument();
        } else {
            throw new IllegalArgumentException("Unknown Document Type");
        }
    }
}
