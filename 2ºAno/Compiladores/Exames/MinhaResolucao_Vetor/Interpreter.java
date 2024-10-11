import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Interpreter extends VectorBaseVisitor<Vector> {
   private Scanner sc = new Scanner(System.in);
   private HashMap<String, Vector> memory = new HashMap<>();


   @Override public Vector visitPrintOutput(VectorParser.PrintOutputContext ctx) {
      if (ctx.listExpr() == null) {
         System.out.println();
         return visitChildren(ctx);
      }

      StringBuilder output = new StringBuilder();
      for (VectorParser.ExprContext exprCtx : ctx.listExpr().expr()) {
         output.append(visit(exprCtx)).append("\n");
      }
      // Remove the trailing space
      if (output.length() > 0) output.setLength(output.length()-1);

      System.out.println(output.toString());
      return visitChildren(ctx);
   }
   
   @Override public Vector visitAssignValue(VectorParser.AssignValueContext ctx) {
      String id = ctx.ID().getText();
      Vector value = visit(ctx.expr());

      memory.put(id, value);
      return value;
   }
   
   @Override public Vector visitExprID(VectorParser.ExprIDContext ctx) {
      String id = ctx.ID().getText();

      if (!memory.containsKey(id)) {
         System.out.println("Error: Variable was not defined");
         return null;
      }
      return memory.get(id);
   }

   @Override public Vector visitExprParentheses(VectorParser.ExprParenthesesContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Vector visitExprInt(VectorParser.ExprIntContext ctx) {
      ArrayList<Double> value = new ArrayList<>();
      double number = Double.parseDouble(ctx.INT().getText());
      value.add(number);
      Vector res = new Vector(value, true);  // Cria um vetor que é um escalar
      if (res.error()) {
         System.err.println("ERRO: Número inteiro inválido!");
         return null;
      }
      return res;
   }

   @Override public Vector visitExprDouble(VectorParser.ExprDoubleContext ctx) {
      ArrayList<Double> value = new ArrayList<>();
      double number = Double.parseDouble(ctx.DOUBLE().getText());
      value.add(number);
      Vector res = new Vector(value, true);
      if (res.error()) {
         System.err.println("ERRO: Vetor inválido!");
         return null;
      }
      return res;
   }

   @Override public Vector visitExprVector(VectorParser.ExprVectorContext ctx) {
      String vector = ctx.VECTOR().getText();
      Vector res = new Vector(vector);
      if (res.error()) {
         System.err.println("ERRO: Vetor inválido!");
         return null;
      }
      return res;
   }
   
   @Override public Vector visitExprUnary(VectorParser.ExprUnaryContext ctx) {
      Vector res = null;
      Vector vector = visit(ctx.expr());
      String op = ctx.op.getText();
      if (vector != null && op != null) {
         if (op.equals("-")) {
               res = vector.symmetric();
         } else {
               res = vector;
         }
      }
      return res;
   }

   @Override public Vector visitExprMultDiv(VectorParser.ExprMultDivContext ctx) {
      Vector res = null;
      Vector v1 = visit(ctx.expr(0));
      Vector v2 = visit(ctx.expr(1));
      if (v1 != null && v2 != null) {
         switch (ctx.op.getText()) {
            case "*":
               if (!v1.scalar() && !v2.scalar()) {
                  System.err.println("ERRO: Não existe multiplicação entre dois vetores!");
                  return null;
               }
               res = v1.multiplication(v2);
               break;
            case ".":
               if (v1.scalar() || v2.scalar()) {
                  System.err.println("ERRO: Não existe produto interno sem ser entre vetores!");
                  return null;
               }
               if (v1.dimension() != v2.dimension()) {
                  System.err.println("ERRO: Não existe produto interno entre vetores de dimensões diferentes!");
                  return null;
               }
               res = v1.multiplication(v2);
               break;
         }
      }
      return res;
   }

   @Override public Vector visitExprAddSub(VectorParser.ExprAddSubContext ctx) {
      Vector res = null;
      Vector v1 = visit(ctx.expr(0));
      Vector v2 = visit(ctx.expr(1));
      if (v1 != null && v2 != null) {
         if (v1.scalar() != v2.scalar()) {
               System.err.println("ERRO: Não é possível adicionar/subtrair escalares com vetores!");
               return null;
         }
         if (v1.dimension() != v2.dimension()) {
               System.err.println("ERRO: Não é possível adicionar/subtrair elementos com dimensões diferentes!");
               return null;
         }
         switch (ctx.op.getText()) {
               case "+":
                  res = v1.add(v2);
                  break;
               case "-":
                  res = v1.subtract(v2);
                  break;
         }
      }
      return res;
   }
}
