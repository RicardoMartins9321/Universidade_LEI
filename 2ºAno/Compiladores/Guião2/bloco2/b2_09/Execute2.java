import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Execute2 extends FracCalculatorBaseVisitor<Fraction> {
   Map<String,Fraction> vars = new HashMap<String,Fraction>();
   Scanner scanner; // Declare Scanner object

   @Override public Fraction visitProgram(FracCalculatorParser.ProgramContext ctx) {
      return visitChildren(ctx);
   }

   @Override public Fraction visitStat(FracCalculatorParser.StatContext ctx) {
      return visitChildren(ctx);
   }

   @Override public Fraction visitPrint(FracCalculatorParser.PrintContext ctx) {
      Fraction res = visit(ctx.expr());
      System.out.println(res);
      return null;
   }

   @Override public Fraction visitAssignment(FracCalculatorParser.AssignmentContext ctx) {
      if (ctx != null) {
         String id = ctx.ID().getText();
         Fraction value = (Fraction)visit(ctx.expr());
         vars.put(id,value);
      }
      return null;
   }

     @Override public Fraction visitReadInput(FracCalculatorParser.ReadInputContext ctx) {
        String varName = ctx.ID().getText();
        System.out.print(varName + ": ");
        String input = scanner.nextLine();
        String[] parts = input.split("/");
        if (parts.length != 2) {
            System.err.println("Invalid fraction format");
            System.exit(1);
        }
        int numerator = Integer.parseInt(parts[0]);
        int denominator = Integer.parseInt(parts[1]);
        if (denominator == 0) {
            System.err.println("Division by zero");
            System.exit(1);
        }
        Fraction fraction = new Fraction(numerator, denominator);
        vars.put(varName, fraction);
        return fraction;
    }

   @Override public Fraction visitExprAddSub(FracCalculatorParser.ExprAddSubContext ctx) {
      Fraction res = null;
      Fraction num1 = (Fraction)visit(ctx.expr(0));
      Fraction num2 = (Fraction)visit(ctx.expr(1));

      if (num1 != null && num2 != null) {
         String op = ctx.op.getText();
         switch (op) {
            case "+":
               res = num1.add(num2);
               break;
            case "-":
               res = num1.subtract(num2);
               break;
         }
      }
      return res;
   }

   @Override public Fraction visitExprPow(FracCalculatorParser.ExprPowContext ctx) {
      Fraction base = (Fraction)visit(ctx.expr());
      Fraction exp = new Fraction(Integer.parseInt(ctx.Integer().getText()));
      Fraction res = base.powtencia(exp);
      return res;
   }

   @Override public Fraction visitExprParent(FracCalculatorParser.ExprParentContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Fraction visitExprUnaryReduce(FracCalculatorParser.ExprUnaryReduceContext ctx) {
      Fraction res = (Fraction)visit(ctx.expr());
      if (ctx.op.getText().equals("-")) {
         res = res.multiply(new Fraction(-1,1));
      }
      else if (ctx.op.getText().equals("reduce")) {
         res = res.reduce();
      }
      return res;
   }

   @Override public Fraction visitExprMultDiv(FracCalculatorParser.ExprMultDivContext ctx) {
      Fraction res = null;
      Fraction num1 = (Fraction)visit(ctx.expr(0));
      Fraction num2 = (Fraction)visit(ctx.expr(1));

      if (num1 != null && num2 != null) {
         String op = ctx.op.getText();
         switch (op) {
            case "*":
               res = num1.multiply(num2);
               break;
            case "/":
               if (num2.getNumerator() == 0) {
                  System.err.println("Division by zero");
                  System.exit(1);
               }
               res = num1.divide(num2);
               break;
         }
      }
      return res;
   }

   @Override public Fraction visitExprInteger(FracCalculatorParser.ExprIntegerContext ctx) {
      return new Fraction(Integer.parseInt(ctx.Integer().getText()));
   }

   @Override public Fraction visitExprId(FracCalculatorParser.ExprIdContext ctx) {
      return vars.get(ctx.ID().getText());
   }

   @Override public Fraction visitExprFraction(FracCalculatorParser.ExprFractionContext ctx) {
      Integer numr = Integer.parseInt(ctx.Integer(0).getText());
      Integer denr = Integer.parseInt(ctx.Integer(1).getText());
      if (denr == 0) {
         System.err.println("Division by zero");
         System.exit(1);
      }
      return new Fraction(numr,denr);
   }
}
