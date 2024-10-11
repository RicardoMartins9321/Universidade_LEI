@SuppressWarnings("CheckReturnValue")
public class Execute extends CalculatorBaseVisitor<Double> {

   @Override public Double visitProgram(CalculatorParser.ProgramContext ctx) {
      Double res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Double visitStat(CalculatorParser.StatContext ctx) {
      Double res = null;

      if(ctx.expr() == null){
         return null;
      }
      res = visit(ctx.expr());
      System.out.println(res);

      return res;
   }

   @Override public Double visitExprAddSub(CalculatorParser.ExprAddSubContext ctx) {
      Double res = null;

      Double a = visit(ctx.expr(0));

      Double b = visit(ctx.expr(1));

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

   @Override public Double visitExprParent(CalculatorParser.ExprParensContext ctx) {
      Double res = null;

      res = visit(ctx.expr());

      return res;

      // return visitChildren(ctx);
   }

   @Override public Double visitExprUnary(CalculatorParser.ExprUnaryContext ctx) {
      Double res = null;
      
      String op = ctx.op.getText();
      if(op.equals("-")){
         res = -visit(ctx.expr());
      }else{
         res = visit(ctx.expr());
      }

      return res;
   }

   @Override public Double visitExprInteger(CalculatorParser.ExprIntegerContext ctx) {
      // Double res = null;
      return Double.parseDouble(ctx.Integer().getText());
      // return visitChildren(ctx);
   }

   @Override public Double visitExprMultDivMod(CalculatorParser.ExprMultDivModContext ctx) {
      Double res = null;

      Double a = visit(ctx.expr(0));
      
      Double b = visit(ctx.expr(1));

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

   @Override public Double visitExprAssignment(CalculatorParser.ExprAssignmentContext ctx) {
      Double res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Double visitExprID(CalculatorParser.ExprIDContext ctx) {
      Double res = null;
      return visitChildren(ctx);
      //return res;
   }
}
