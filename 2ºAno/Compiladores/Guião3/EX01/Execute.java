import org.stringtemplate.v4.*;

@SuppressWarnings("CheckReturnValue")
public class Execute extends csvTableBaseVisitor<ST> {
   STGroup allTemplates=new STGroupFile("test.stg") ;
   @Override public ST visitProgram(csvTableParser.ProgramContext ctx) {
      StringBuilder sb=new StringBuilder();
      int index=0;
      while (ctx.stat(index)!=null) {
         sb.append(((ST)visit(ctx.stat(index++))).render()+"\n");
      }
     
      ST res = allTemplates.getInstanceOf("xmlMultiline");
      res.add("tag","table");
      res.add("entry",sb.toString());
      System.out.println(res.render());
      return res;
   }

   @Override public ST visitStat(csvTableParser.StatContext ctx) {
      String expr = ((ST)visit(ctx.expr())).render();
      ST res = allTemplates.getInstanceOf("xmlMultiline");
      res.add("tag","tr");
      res.add("entry",expr);
      //System.out.println(res.render());
      return res;
   }

   @Override public ST visitExprRec(csvTableParser.ExprRecContext ctx) {
      ST res = allTemplates.getInstanceOf("StrAdd");
      res.add("str1",((ST)visit(ctx.expr(0))).render());
      res.add("str2",((ST)visit(ctx.expr(1))).render());
      return res;
   }

   @Override public ST visitExprStr(csvTableParser.ExprStrContext ctx) {
      ST res = allTemplates.getInstanceOf("xmlUniqueLine");
      res.add("tag","th");
      res.add("entry",ctx.String1().getText());
      return res;
   }
}
