import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class Interpreter extends StrLangBaseVisitor<String> {
   private Scanner sc = new Scanner(System.in);
   private HashMap <String, String> memory = new HashMap<>();


   @Override public String visitPrintStat(StrLangParser.PrintStatContext ctx) {
      /* For a simple print statement that only takes one argument
      System.out.println(visit(ctx.expr()));
      return visitChildren(ctx);*/

      if (ctx.exprList() == null) {
         // No expressions, just print an empty line
         System.out.println();
      } else {
         StringBuilder output = new StringBuilder();
         for (StrLangParser.ExprContext exprCtx : ctx.exprList().expr()) {
             output.append(visit(exprCtx)).append("\n");
         }
         // Remove the trailing space
         if (output.length() > 0) {
             output.setLength(output.length() - 1);
         }
         System.out.println(output.toString());
      }
      return visitChildren(ctx);
   }

   @Override public String visitAssignValue(StrLangParser.AssignValueContext ctx) {
      String id = ctx.ID().getText();
      String value = visit(ctx.expr());
      memory.put(id, value);

      return value;
   }
   
   @Override public String visitExprID(StrLangParser.ExprIDContext ctx) {
      String var = ctx.ID().getText();
      if (!memory.containsKey(var)) return "ERROR: Variable " + var + " was not defined.";
      /*System.out.println("Error: Variable " + var + " not defined.");
      return null;*/
      return memory.get(var);
   }
   
   @Override public String visitExprString(StrLangParser.ExprStringContext ctx) {
      String res = ctx.STRING().getText();   // returns the text including the ""

      // removes the first and last char of the string which are believed to be the opening and closing ""
      return res.substring(1, res.length()-1);
      /*removes every occurence of "" inside of the string even if there are multiples of them
      return ctx.STRING().getText().replace("\"", "");*/
   }
   
   @Override public String visitExprParentheses(StrLangParser.ExprParenthesesContext ctx) {
      return visit(ctx.expr());
   }

   @Override public String visitExprInput(StrLangParser.ExprInputContext ctx) {
      /* visit(ctx.expr()) will call the correct visitor method based on the type of the expression. 
      For example, if the expression is a string literal, it will call visitExprString. If the expression is an identifier, it will call visitExprID, and so on.
      therefore now being able to handle errors and all the different types of expressions inside of their respective functions*/
      // Visit the expression and get its value
      String prompt = visit(ctx.expr());

      System.out.print(prompt + " ");  // print the prompt

      String res = sc.nextLine();   // get user input
      return res;
   }

   @Override public String visitExprConcatenate(StrLangParser.ExprConcatenateContext ctx) {
      String baseExpr = visit(ctx.expr(0));
      String addedExpr = visit(ctx.expr(1));
      //same as the one above, but in below we are actually using the labels we set in the grammar*/
      /*String baseExpr = visit(ctx.e1());
      String addedExpr = visit(ctx.e2());*/
      String finalExpr = baseExpr + addedExpr;

      return finalExpr;
   }
   
   @Override public String visitExprRemove(StrLangParser.ExprRemoveContext ctx) {
      String baseExpr = visit(ctx.expr(0));
      String subtractExpr = visit(ctx.expr(1));
      /*String baseExpr = visit(ctx.e1());
      String subtractExpr = visit(ctx.e2());*/
      String finalExpr = baseExpr.replace(subtractExpr, "");

      return finalExpr;
   }

   @Override public String visitExprTrim(StrLangParser.ExprTrimContext ctx) {
      return visit(ctx.expr()).trim();
   }
   
   @Override public String visitExprSubstitute(StrLangParser.ExprSubstituteContext ctx) {
      String original = visit(ctx.expr(0));
      String target = visit(ctx.expr(1));
      String replacement = visit(ctx.expr(2));
      /*String original = visit(ctx.orig());
      String target = visit(ctx.targ());
      String replacement = visit(ctx.repl());*/
      String finalExpr = original.replace(target, replacement);
      
      return finalExpr;
   }
}
