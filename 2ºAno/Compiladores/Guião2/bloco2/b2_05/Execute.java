import java.util.HashMap;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;
@SuppressWarnings("CheckReturnValue")

public class Execute extends NumbersBaseListener {

   public HashMap<String, Integer> map = new HashMap<>();

   @Override public void enterExpr(NumbersParser.ExprContext ctx) {
      map.put(ctx.Word().getText(), Integer.parseInt(ctx.Number().getText()));
   }

   
}
