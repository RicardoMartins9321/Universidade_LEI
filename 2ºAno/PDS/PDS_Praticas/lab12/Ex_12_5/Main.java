package Ex_12_5;
import java.io.File;
import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

class MyFileVisitor extends SimpleFileVisitor<Path> {
    private long soma=0;
    private long somaLocal=0;
    private boolean doPrint =true;
    private boolean isRecursive ;
    public MyFileVisitor(boolean isRecursive) {
        this.isRecursive = isRecursive;
    }

    @Override
    public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
        File file1=file.toFile();
        if (!file1.isDirectory()) {
            if (doPrint) {
                System.out.println(file.getFileName()+": "+file1.length());
                soma+=file1.length();
            }
            somaLocal+=file1.length();
        }
        else if(isRecursive){
            somaLocal=0;
            doPrint=false;
            for (File file2 : file.toFile().listFiles()) {
                visitFile(file2.toPath(), attrs);
            }
            System.out.println(file.getFileName()+": "+ somaLocal);
            doPrint=true;
            for (File file2 : file.toFile().listFiles()) {
                visitFile(file2.toPath(), attrs);
            }
        }
        return FileVisitResult.CONTINUE;
    }

    @Override
    public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
        for (File file : dir.toFile().listFiles()) {
            visitFile(file.toPath(), attrs);
        }
        System.out.println("Total: "+soma);
        return FileVisitResult.TERMINATE;
    }


 }
public class Main {
    public static void main(String[] args) throws IOException {
        if (args.length!=1||args.length!=2) {
            System.err.println("Numero de args inválido.");
        }
        boolean isRecursive=args[0].strip().equals("-r");
        String pathString=args[isRecursive?1:0];
        System.out.println(Files.walkFileTree(Paths.get(pathString)
        ,new MyFileVisitor(isRecursive)));
    }
}
