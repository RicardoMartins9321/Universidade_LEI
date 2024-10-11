import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Interpreter extends CalComplexBaseVisitor<ComplexNumber> {
   private Scanner sc = new Scanner(System.in);
   private HashMap<String, ComplexNumber> memory = new HashMap<>();
   
   @Override public ComplexNumber visitPrintOutput(CalComplexParser.PrintOutputContext ctx) {
      if (ctx.listExpr() == null) {
         System.out.println();
         return visitChildren(ctx);
      }

      StringBuilder output = new StringBuilder();
      for (CalComplexParser.ExprContext exprCtx : ctx.listExpr().expr()) {
         output.append(visit(exprCtx)).append("\n");
      }
      // Remove the trailing space
      if (output.length() > 0) output.setLength(output.length()-1);

      System.out.println(output.toString());
      return visitChildren(ctx);
   }
   
   @Override public ComplexNumber visitAssignValue(CalComplexParser.AssignValueContext ctx) {
      String id = ctx.ID().getText();
      ComplexNumber value = visit(ctx.expr());

      memory.put(id, value);
      return value;
   }

   @Override public ComplexNumber visitExprComplexNumber(CalComplexParser.ExprComplexNumberContext ctx) {
      return new ComplexNumber(ctx.getText());
   }

   @Override public ComplexNumber visitExprInt(CalComplexParser.ExprIntContext ctx) {
      return new ComplexNumber(Integer.parseInt(ctx.INT().getText()));
   }

   @Override public ComplexNumber visitExprString(CalComplexParser.ExprStringContext ctx) {
      return new ComplexNumber(ctx.STRING().getText().replace("\"", ""));
   }

   @Override public ComplexNumber visitExprID(CalComplexParser.ExprIDContext ctx) {
      String id = ctx.ID().getText();

      if (!memory.containsKey(id)) {
         System.out.println("Error: Variable was not defined");
         return null;
      }
      return memory.get(id);
   }

   @Override public ComplexNumber visitExprInput(CalComplexParser.ExprInputContext ctx) {
      String num = "";
      System.out.print("Real: ");
      num += sc.nextLine();
      System.out.print("Imaginary: ");
      String input = sc.nextLine();
      if (input.length() == 1) {
         num += "+" + input + "i";
      } else {
         num += input + "i";
      }

      ComplexNumber res = new ComplexNumber(num);

      return res;
   }

   @Override public ComplexNumber visitExprParentheses(CalComplexParser.ExprParenthesesContext ctx) {
      return visit(ctx.expr());
   }

   @Override public ComplexNumber visitExprUnary(CalComplexParser.ExprUnaryContext ctx) {
      ComplexNumber res = null;
      ComplexNumber n = visit(ctx.expr());
      switch(ctx.op.getText()) {
         case "-":
            res = new ComplexNumber(-n.getRealNum(), -n.getImaginaryNum());
         case "+":
            res = n;
      }

      return res;
   }

   @Override public ComplexNumber visitExprMultDiv(CalComplexParser.ExprMultDivContext ctx) {
      ComplexNumber left = visit(ctx.expr(0));
      ComplexNumber right = visit(ctx.expr(1));
      switch(ctx.op.getText()) {
         case "*":
            return left.multiplyNumbers(right);
         case "/":
            return left.divideNumbers(right);
         default:
            return left;
      }
   }

   @Override public ComplexNumber visitExprAddSub(CalComplexParser.ExprAddSubContext ctx) {
      ComplexNumber left = visit(ctx.expr(0));
      ComplexNumber right = visit(ctx.expr(1));
      switch(ctx.op.getText()) {
         case "+":
            return left.addNumbers(right);
         case "-":
            return left.subtractNumbers(right);
         default:
            return left;
      }
   }

   @Override public ComplexNumber visitExprConjugado(CalComplexParser.ExprConjugadoContext ctx) {
      ComplexNumber n = visit(ctx.expr());
      return n.conjugate();
   }

   @Override public ComplexNumber visitExprModule(CalComplexParser.ExprModuleContext ctx) {
      ComplexNumber n = visit(ctx.expr());
      System.out.println("Module: " + n.module());
      return n;
   }

}
