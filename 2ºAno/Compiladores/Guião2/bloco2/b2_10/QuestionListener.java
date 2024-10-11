import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;


@SuppressWarnings("CheckReturnValue")

public class QuestionListener extends QuestionGrammarBaseListener {
    private Map<String, List<Question>> questionsGroup = new HashMap<>();
    private String currentGroupID;

   @Override
    public void enterQuestion(QuestionGrammarParser.QuestionContext ctx) {
        if (currentGroupID != null) {
            String text = ctx.TEXT().getText(); // Access the entire text of the question context
            Question question = new Question(text);
            questionsGroup.get(currentGroupID).add(question);
        }
    }

   @Override
    public void exitAnswer(QuestionGrammarParser.AnswerContext ctx) {
        if (currentGroupID != null) {
            String text = ctx.TEXT().getText();
            int score = Integer.parseInt(ctx.INTEGER().getText());
            Answer answer = new Answer(text, score);
            List<Question> questions = questionsGroup.get(currentGroupID);
            if (!questions.isEmpty()) {
                questions.get(questions.size() - 1).addAnswer(answer);
            }
        }
    }

    public List<Question> getQuestionsForGroup(String groupID) {
        return questionsGroup.getOrDefault(groupID, new ArrayList<>());
    }

   @Override
    public void enterGroup(QuestionGrammarParser.GroupContext ctx) {
        String groupID = ctx.TEXT(0).getText();
        if (groupID.equals(currentGroupID)) {
            super.enterGroup(ctx);
        }
    }

    @Override
    public void exitGroup(QuestionGrammarParser.GroupContext ctx) {
        if (ctx.TEXT(0).getText().equals(currentGroupID)) {
            super.exitGroup(ctx);
        }
    }
}
