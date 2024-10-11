package FileStream;

// Component
interface FileStream {
    void read();
}

// Concrete Component
class SimpleFileStream implements FileStream {
    public void read() {
        System.out.println("Reading from a simple file stream.");
    }
}

// Decorator
abstract class FileStreamDecorator implements FileStream {
    protected FileStream fileStream;

    public FileStreamDecorator(FileStream fileStream) {
        this.fileStream = fileStream;
    }

    public void read() {
        fileStream.read();
    }
}

// Concrete Decorators
class BufferedFileStream extends FileStreamDecorator {
    public BufferedFileStream(FileStream fileStream) {
        super(fileStream);
    }

    public void read() {
        System.out.println("Adding buffering to the file stream.");
        fileStream.read();
    }
}

class CompressedFileStream extends FileStreamDecorator {
    public CompressedFileStream(FileStream fileStream) {
        super(fileStream);
    }

    public void read() {
        System.out.println("Adding compression to the file stream.");
        fileStream.read();
    }
}

// Client
public class FileStreamDemo {
    public static void main(String[] args) {
        FileStream fileStream = new SimpleFileStream();
        FileStream bufferedStream = new BufferedFileStream(fileStream);
        FileStream compressedBufferedStream = new CompressedFileStream(bufferedStream);

        compressedBufferedStream.read();
    }
}

