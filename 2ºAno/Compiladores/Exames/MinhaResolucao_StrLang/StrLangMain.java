import java.io.IOException;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class StrLangMain {
   public static void main(String[] args) {
      if (args.length == 0) {
         System.out.println("ERROR: No files provided.");
         System.out.println("Usage: java StrLangMain filename <moreFiles>");
         System.exit(1);
      }

      for (String filename : args) {
         java.io.File file = new java.io.File(filename);
         if (!file.exists() || !file.isFile()) {
            System.out.println("ERROR: File " + filename + " does not exist or is not a file.");
            continue;
         }

         try {
            // create a CharStream that reads from standard input:
            CharStream input = CharStreams.fromFileName(filename);
            // create a lexer that feeds off of input CharStream:
            StrLangLexer lexer = new StrLangLexer(input);
            // create a buffer of tokens pulled from the lexer:
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            // create a parser that feeds off the tokens buffer:
            StrLangParser parser = new StrLangParser(tokens);
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
