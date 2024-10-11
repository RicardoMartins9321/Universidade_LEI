package File_System;

// Component
abstract class FileSystemComponent {
    abstract void display();
}

// Leaf
class File extends FileSystemComponent {
    private String name;

    public File(String name) {
        this.name = name;
    }

    public void display() {
        System.out.println("File: " + name);
    }
}

// Composite
class Folder extends FileSystemComponent {
    private List<FileSystemComponent> children = new ArrayList<>();
    private String name;

    public Folder(String name) {
        this.name = name;
    }

    public void add(FileSystemComponent component) {
        children.add(component);
    }

    public void display() {
        System.out.println("Folder: " + name);
        for (FileSystemComponent component : children) {
            component.display();
        }
    }
}

// Client
public class FileSystemDemo {
    public static void main(String[] args) {
        Folder rootFolder = new Folder("root");
        File file1 = new File("file1.txt");
        Folder subFolder = new Folder("subfolder");

        rootFolder.add(file1);
        rootFolder.add(subFolder);

        File file2 = new File("file2.txt");
        subFolder.add(file2);

        rootFolder.display();
    }
}
