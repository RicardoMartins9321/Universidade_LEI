@SuppressWarnings("CheckReturnValue")
public class Execute extends HelloBaseVisitor<String> {

   @Override public String visitMain(HelloParser.MainContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitConversation(HelloParser.ConversationContext ctx) {
      String res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitGreetings(HelloParser.GreetingsContext ctx) {
      String id = ctx.ID().getText();
      System.out.println("Olá" + id);
      //return res;
      
   }

   @Override public String visitBye(HelloParser.ByeContext ctx) {
      String id = ctx.ID().getText();
      System.out.println("Adeus" + id);
      //return res;
   }
}
