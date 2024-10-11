import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Interpreter extends FracLangBaseVisitor<Fraction> {
   private Map<String, Fraction> memory = new HashMap<>();
   private Scanner sc = new Scanner(System.in);
   
   @Override
   public Fraction visitDisplay(FracLangParser.DisplayContext ctx) {
      Fraction res = visit(ctx.expr());
      System.out.println("Result: " + res);
      return res;
   }
   
   @Override
   public Fraction visitAssignValue(FracLangParser.AssignValueContext ctx) {
      String id = ctx.ID().getText();
      Fraction value = visit(ctx.expr());
      memory.put(id, value);
      System.out.println("Assigned " + value + " to variable " + id);
      return value;
   }
   
   @Override
   public Fraction visitExprId(FracLangParser.ExprIdContext ctx) {
     String id = ctx.ID().getText();
     if (memory.containsKey(id)) {
        return memory.get(id);
     }
     System.err.println("Semantic error: variable '" + id + "' not defined");
     System.exit(1);
     return null; // This line will never be reached, but it's required to satisfy the method signature    
   }

   @Override
   public Fraction visitExprInt(FracLangParser.ExprIntContext ctx) {
       return new Fraction(Integer.parseInt(ctx.INT().getText()), 1);
   }

   @Override
   public Fraction visitExprFraction(FracLangParser.ExprFractionContext ctx) {
       String fractionText = ctx.FRACTION().getText();
       String[] parts = fractionText.split("/");
       int numerator = Integer.parseInt(parts[0]);
       int denominator = (parts.length > 1) ? Integer.parseInt(parts[1]) : 1;
       if (denominator == 0) {
           throw new RuntimeException("Division by zero");
       }
       return new Fraction(numerator, denominator);
   }

   @Override
   public Fraction visitExprParentheses(FracLangParser.ExprParenthesesContext ctx) {
      return visit(ctx.expr());
   }

   @Override
   public Fraction visitExprUnary(FracLangParser.ExprUnaryContext ctx) {
       Fraction value = visit(ctx.expr());
       if (ctx.op.getText().equals("-")) {
           value = value.negate();
       }
       return value;
   }
   
   @Override
   public Fraction visitExprMultDiv(FracLangParser.ExprMultDivContext ctx) {
        Fraction left = visit(ctx.expr(0));
        Fraction right = visit(ctx.expr(1));
        Fraction result;
        switch (ctx.op.getText()) {
           case "*":
           result = left.multiply(right);
           break;
           case ":":
           result = left.divide(right);
           break;
           default:
           throw new RuntimeException("Unknown operator: " + ctx.op.getText());
         }
        return result;
      }
      
   @Override
   public Fraction visitExprAddSub(FracLangParser.ExprAddSubContext ctx) {
      Fraction left = visit(ctx.expr(0));
      Fraction right = visit(ctx.expr(1));
      Fraction result;
      switch (ctx.op.getText()) {
         case "+":
            result = left.add(right);
            break;
         case "-":
            result = left.subtract(right);
            break;
         default:
            throw new RuntimeException("Unknown operator: " + ctx.op.getText());
      }
      return result;
   }

    @Override
    public Fraction visitExprRead(FracLangParser.ExprReadContext ctx) {
      String prompt = ctx.STRING().getText();
      System.out.print(prompt + ": ");  // print the prompt with a colon for clarity

      // Read user input
      String res = sc.nextLine();

      // Handle input and create Fraction
      String[] parts = res.split("/");
      int numerator = Integer.parseInt(parts[0]);
      int denominator = (parts.length > 1) ? Integer.parseInt(parts[1]) : 1;
      
      if (denominator == 0) {
         throw new RuntimeException("Division by zero is not allowed.");
      }

      return new Fraction(numerator, denominator);
    }

   @Override
   public Fraction visitExprReduce(FracLangParser.ExprReduceContext ctx) {
         Fraction value = visit(ctx.expr());
         value.reduce();
         return value;
   }
}