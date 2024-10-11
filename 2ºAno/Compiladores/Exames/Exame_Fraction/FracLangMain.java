import java.io.IOException;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class FracLangMain {
   public static void main(String[] args) {
      if (args.length == 0) {
         System.out.println("ERROR: No files provided.");
         System.out.println("Usage: java FracLangMain filename <moreFiles>");
         System.exit(1);
      }

      for (String filename : args) {
         System.out.println("\nReading file: " + filename);
         java.io.File file = new java.io.File(filename);
         if (!file.exists() || !file.isFile()) {
            System.out.println("ERROR: File " + filename + " does not exist or is not a file.");
            continue;
         }

         try {
            // create a CharStream that reads from standard input:
            CharStream input = CharStreams.fromFileName(filename);
            // create a lexer that feeds off of input CharStream:
            FracLangLexer lexer = new FracLangLexer(input);
            // create a buffer of tokens pulled from the lexer:
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            // create a parser that feeds off the tokens buffer:
            FracLangParser parser = new FracLangParser(tokens);
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
