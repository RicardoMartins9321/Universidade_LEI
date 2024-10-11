@SuppressWarnings("CheckReturnValue")
public class Execute3 extends CalculatorBaseVisitor<Long> {

   @Override public Long visitProgram(CalculatorParser.ProgramContext ctx) {
      Long res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Long visitStat(CalculatorParser.StatContext ctx) {
      Long res = null;

      if(ctx.expr() == null){
         return null;
      }
      res = visit(ctx.expr());
      System.out.println(res);

      return res;
   }

   @Override public Long visitExprAddSub(CalculatorParser.ExprAddSubContext ctx) {
      Long res = null;

      Long a = visit(ctx.expr(0));

      Long b = visit(ctx.expr(1));

      String op = ctx.op.getText();

      switch (op) {
         case "+":
            res = a + b;
            break;
         case "-":
            res = a - b;
            break;
         default:
            System.out.println("Operador inválido");
      }

      return res;

      // return visitChildren(ctx);
   }

   @Override public Long visitExprParent(CalculatorParser.ExprParensContext ctx) {
      Long res = null;

      res = visit(ctx.expr());

      return res;

      // return visitChildren(ctx);
   }

   @Override public Long visitExprUnary(CalculatorParser.ExprUnaryContext ctx) {
      Long res = null;
      
      String op = ctx.op.getText();
      if(op.equals("-")){
         res = -visit(ctx.expr());
      }else{
         res = visit(ctx.expr());
      }

      return res;
   }

   @Override public Long visitExprInteger(CalculatorParser.ExprIntegerContext ctx) {
      // Long res = null;
      return Long.parseLong(ctx.Integer().getText());
      // return visitChildren(ctx);
   }

   @Override public Long visitExprMultDivMod(CalculatorParser.ExprMultDivModContext ctx) {
      Long res = null;

      Long a = visit(ctx.expr(0));
      
      Long b = visit(ctx.expr(1));

      String op = ctx.op.getText();

      switch (op) {
         case "*":
            res = a * b;
            break;
         case "/":
            res = a / b;
            break;
         case "%":
            res = a % b;
            break;
         default:
            System.out.println("Operador inválido");
      }

      return res;
   }
}

