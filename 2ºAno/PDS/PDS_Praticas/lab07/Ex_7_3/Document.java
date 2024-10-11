package Ex_7_3;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Document {
    private List<String> content = new ArrayList<>();
    private String filename;

    public Document(String filename) {
        this.filename = filename;
        Load();
    }

    private void Load() {
        try (Scanner scanner = new Scanner(new File(filename))) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] words = line.split("\n"); // Split by whitespace using regex
                for (String word : words) {
                    content.add(word);
                }
            }
        } catch (FileNotFoundException e) {
            System.err.println("File not found: " + filename);
        }
    }

    public String[] getContent() {
        return content.toArray(new String[0]);
    }
}
