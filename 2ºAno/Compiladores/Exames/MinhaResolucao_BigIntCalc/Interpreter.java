import java.math.BigInteger;
import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Interpreter extends BigIntCalcBaseVisitor<BigInteger> {
   private Scanner sc = new Scanner(System.in);
   private HashMap<String, BigInteger> memory = new HashMap<>();


   @Override public BigInteger visitPrintOutput(BigIntCalcParser.PrintOutputContext ctx) {
      if (ctx.listExpr() == null) {
         System.out.println();
         return visitChildren(ctx);
      }

      StringBuilder output = new StringBuilder();
      for (BigIntCalcParser.ExprContext exprCtx : ctx.listExpr().expr()) {
         output.append(visit(exprCtx)).append("\n");
      }
      // Remove the trailing space
      if (output.length() > 0) output.setLength(output.length()-1);

      System.out.println(output.toString());
      return visitChildren(ctx);
   }

   @Override public BigInteger visitAssignValue(BigIntCalcParser.AssignValueContext ctx) {
      String id = ctx.ID().getText();
      BigInteger value = visit(ctx.expr());

      memory.put(id, value);
      return value;
   }

   @Override public BigInteger visitExprID(BigIntCalcParser.ExprIDContext ctx) {
      String id = ctx.ID().getText();

      if (!memory.containsKey(id)) {
         System.out.println("Error: Variable was not defined");
         return null;
      }
      return memory.get(id);
   }

   @Override public BigInteger visitExprInt(BigIntCalcParser.ExprIntContext ctx) {
      return new BigInteger(ctx.INT().getText());
   }

   @Override public BigInteger visitExprParentheses(BigIntCalcParser.ExprParenthesesContext ctx) {
      return visit(ctx.expr());
   }

   @Override public BigInteger visitExprUnary(BigIntCalcParser.ExprUnaryContext ctx) {
      BigInteger value = visit(ctx.expr());
      if (ctx.op.getText().equals("-")) {
         return value.negate();
      }
      return value;  // Para o operador unário '+'
   }

   @Override public BigInteger visitExprMultDiv(BigIntCalcParser.ExprMultDivContext ctx) {
      BigInteger left = visit(ctx.expr(0));
      BigInteger right = visit(ctx.expr(1));

      switch (ctx.op.getText()) {
         case "*":
            return left.multiply(right);
         case "div":
            return left.divide(right);
         default:
            return null;
      }
   }

   @Override public BigInteger visitExprAddSub(BigIntCalcParser.ExprAddSubContext ctx) {
      BigInteger left = visit(ctx.expr(0));
      BigInteger right = visit(ctx.expr(1));

      switch (ctx.op.getText()) {
         case "+":
            return left.add(right);
         case "-":
            return left.subtract(right);
         default:
            return null;
      }
   }

   @Override public BigInteger visitExprModule(BigIntCalcParser.ExprModuleContext ctx) {
      BigInteger left = visit(ctx.expr(0));
      BigInteger right = visit(ctx.expr(1));

      if (left != null && right != null) {
         return left.mod(right);
      }
      return null;
   }
}
