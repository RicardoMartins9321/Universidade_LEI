import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Random;
import java.nio.file.Files;
import java.util.*;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;


public class QuestionGenerator {
    public static void main(String[] args) throws IOException {
        if (args.length != 3) {
            System.out.println("Usage: java QuestionGenerator <inputFile> <groupID> <numQuestions>");
            return;
        }

        String inputFile = args[0];
        String groupID = args[1];
        int numQuestions = Integer.parseInt(args[2]);

        CharStream charStream = CharStreams.fromPath(Paths.get(inputFile));
        QuestionGrammarLexer lexer = new QuestionGrammarLexer(charStream);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        QuestionGrammarParser parser = new QuestionGrammarParser(tokens);

        ParseTree tree = parser.file();
        ParseTreeWalker walker = new ParseTreeWalker();
        QuestionListener listener = new QuestionListener();
        walker.walk(listener, tree);

        List<Question> questions = listener.getQuestionsForGroup(groupID);
        if (questions.isEmpty()) {
            System.out.println("No questions found for group ID: " + groupID);
            return;
        }

        Random random = new Random();
        for (int i = 0; i < numQuestions; i++) {
            int randomIndex = random.nextInt(questions.size());
            Question randomQuestion = questions.get(randomIndex);
            System.out.println("Question " + (i + 1) + ": " + randomQuestion.getText());
            for (int j = 0; j < randomQuestion.getAnswers().size(); j++) {
                System.out.println((char) ('a' + j) + ") " + randomQuestion.getAnswers().get(j).getText());
            }
            System.out.println();
        }
    }
}
