@SuppressWarnings("CheckReturnValue")
public class Execute extends QuestionGrammarBaseVisitor<String> {

   @Override public String visitFile(QuestionGrammarParser.FileContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitLine(QuestionGrammarParser.LineContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitQuestion(QuestionGrammarParser.QuestionContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitAnswer(QuestionGrammarParser.AnswerContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitGroup(QuestionGrammarParser.GroupContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }
}
