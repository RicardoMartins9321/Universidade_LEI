import java.io.File;
import java.io.IOException;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class CalComplexMain {
   public static void main(String[] args) {
      if (args.length == 0) {
         System.out.println("ERROR: No files were provided");
         System.out.println("Usage: java CalComplexMain filename <moreFileNames>");
         System.exit(0);
      }
      
      for (String filename : args) {
         java.io.File file = new File(filename);
         if (!file.exists() || !file.isFile()) {
            System.out.println("ERROR: File" + filename + "does not exist or isn't a file");
            continue;
         } 

         try {
            // create a CharStream that reads from standard input:
            CharStream input = CharStreams.fromFileName(filename);
            // create a lexer that feeds off of input CharStream:
            CalComplexLexer lexer = new CalComplexLexer(input);
            // create a buffer of tokens pulled from the lexer:
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            // create a parser that feeds off the tokens buffer:
            CalComplexParser parser = new CalComplexParser(tokens);
            // replace error listener:
            //parser.removeErrorListeners(); // remove ConsoleErrorListener
            //parser.addErrorListener(new ErrorHandlingListener());
            // begin parsing at program rule:
            ParseTree tree = parser.program();
            if (parser.getNumberOfSyntaxErrors() == 0) {
               // print LISP-style tree:
               // System.out.println(tree.toStringTree(parser));
               Interpreter visitor0 = new Interpreter();
               visitor0.visit(tree);
            }
         }
         catch(IOException e) {
            e.printStackTrace();
            System.exit(1);
         }
         catch(RecognitionException e) {
            e.printStackTrace();
            System.exit(1);
         }
      }
   }
}
