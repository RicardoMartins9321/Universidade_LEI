// Generated from /home/ricardo/Universidade/Compiladores/PDrawGrammar.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link PDrawGrammarParser}.
 */
public interface PDrawGrammarListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(PDrawGrammarParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(PDrawGrammarParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterStat(PDrawGrammarParser.StatContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitStat(PDrawGrammarParser.StatContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#penDecl}.
	 * @param ctx the parse tree
	 */
	void enterPenDecl(PDrawGrammarParser.PenDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#penDecl}.
	 * @param ctx the parse tree
	 */
	void exitPenDecl(PDrawGrammarParser.PenDeclContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprPI}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprPI(PDrawGrammarParser.ExprPIContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprPI}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprPI(PDrawGrammarParser.ExprPIContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprBoolOperation}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprBoolOperation(PDrawGrammarParser.ExprBoolOperationContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprBoolOperation}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprBoolOperation(PDrawGrammarParser.ExprBoolOperationContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprString}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprString(PDrawGrammarParser.ExprStringContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprString}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprString(PDrawGrammarParser.ExprStringContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprPoint}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprPoint(PDrawGrammarParser.ExprPointContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprPoint}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprPoint(PDrawGrammarParser.ExprPointContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprParentheses}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprParentheses(PDrawGrammarParser.ExprParenthesesContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprParentheses}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprParentheses(PDrawGrammarParser.ExprParenthesesContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprInt}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprInt(PDrawGrammarParser.ExprIntContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprInt}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprInt(PDrawGrammarParser.ExprIntContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprBoolean}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprBoolean(PDrawGrammarParser.ExprBooleanContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprBoolean}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprBoolean(PDrawGrammarParser.ExprBooleanContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprColor}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprColor(PDrawGrammarParser.ExprColorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprColor}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprColor(PDrawGrammarParser.ExprColorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprInput}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprInput(PDrawGrammarParser.ExprInputContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprInput}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprInput(PDrawGrammarParser.ExprInputContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprAndOr}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprAndOr(PDrawGrammarParser.ExprAndOrContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprAndOr}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprAndOr(PDrawGrammarParser.ExprAndOrContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprMultDivMod}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprMultDivMod(PDrawGrammarParser.ExprMultDivModContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprMultDivMod}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprMultDivMod(PDrawGrammarParser.ExprMultDivModContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprAddSub(PDrawGrammarParser.ExprAddSubContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprAddSub}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprAddSub(PDrawGrammarParser.ExprAddSubContext ctx);
	/**
	 * Enter a parse tree produced by the {@code TypeConversion}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterTypeConversion(PDrawGrammarParser.TypeConversionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code TypeConversion}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitTypeConversion(PDrawGrammarParser.TypeConversionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprReal}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprReal(PDrawGrammarParser.ExprRealContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprReal}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprReal(PDrawGrammarParser.ExprRealContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprId}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExprId(PDrawGrammarParser.ExprIdContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprId}
	 * labeled alternative in {@link PDrawGrammarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExprId(PDrawGrammarParser.ExprIdContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#property}.
	 * @param ctx the parse tree
	 */
	void enterProperty(PDrawGrammarParser.PropertyContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#property}.
	 * @param ctx the parse tree
	 */
	void exitProperty(PDrawGrammarParser.PropertyContext ctx);
	/**
	 * Enter a parse tree produced by the {@code CanvasDeclWithExpr}
	 * labeled alternative in {@link PDrawGrammarParser#canvasDecl}.
	 * @param ctx the parse tree
	 */
	void enterCanvasDeclWithExpr(PDrawGrammarParser.CanvasDeclWithExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code CanvasDeclWithExpr}
	 * labeled alternative in {@link PDrawGrammarParser#canvasDecl}.
	 * @param ctx the parse tree
	 */
	void exitCanvasDeclWithExpr(PDrawGrammarParser.CanvasDeclWithExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#selectCanvas}.
	 * @param ctx the parse tree
	 */
	void enterSelectCanvas(PDrawGrammarParser.SelectCanvasContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#selectCanvas}.
	 * @param ctx the parse tree
	 */
	void exitSelectCanvas(PDrawGrammarParser.SelectCanvasContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#assignment}.
	 * @param ctx the parse tree
	 */
	void enterAssignment(PDrawGrammarParser.AssignmentContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#assignment}.
	 * @param ctx the parse tree
	 */
	void exitAssignment(PDrawGrammarParser.AssignmentContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#assignExpr}.
	 * @param ctx the parse tree
	 */
	void enterAssignExpr(PDrawGrammarParser.AssignExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#assignExpr}.
	 * @param ctx the parse tree
	 */
	void exitAssignExpr(PDrawGrammarParser.AssignExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#propertyName}.
	 * @param ctx the parse tree
	 */
	void enterPropertyName(PDrawGrammarParser.PropertyNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#propertyName}.
	 * @param ctx the parse tree
	 */
	void exitPropertyName(PDrawGrammarParser.PropertyNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#input}.
	 * @param ctx the parse tree
	 */
	void enterInput(PDrawGrammarParser.InputContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#input}.
	 * @param ctx the parse tree
	 */
	void exitInput(PDrawGrammarParser.InputContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#outputExpr}.
	 * @param ctx the parse tree
	 */
	void enterOutputExpr(PDrawGrammarParser.OutputExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#outputExpr}.
	 * @param ctx the parse tree
	 */
	void exitOutputExpr(PDrawGrammarParser.OutputExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#instruc}.
	 * @param ctx the parse tree
	 */
	void enterInstruc(PDrawGrammarParser.InstrucContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#instruc}.
	 * @param ctx the parse tree
	 */
	void exitInstruc(PDrawGrammarParser.InstrucContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#miniInstruc}.
	 * @param ctx the parse tree
	 */
	void enterMiniInstruc(PDrawGrammarParser.MiniInstrucContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#miniInstruc}.
	 * @param ctx the parse tree
	 */
	void exitMiniInstruc(PDrawGrammarParser.MiniInstrucContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#conditional}.
	 * @param ctx the parse tree
	 */
	void enterConditional(PDrawGrammarParser.ConditionalContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#conditional}.
	 * @param ctx the parse tree
	 */
	void exitConditional(PDrawGrammarParser.ConditionalContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#loop}.
	 * @param ctx the parse tree
	 */
	void enterLoop(PDrawGrammarParser.LoopContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#loop}.
	 * @param ctx the parse tree
	 */
	void exitLoop(PDrawGrammarParser.LoopContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#pauseExpr}.
	 * @param ctx the parse tree
	 */
	void enterPauseExpr(PDrawGrammarParser.PauseExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#pauseExpr}.
	 * @param ctx the parse tree
	 */
	void exitPauseExpr(PDrawGrammarParser.PauseExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#execute}.
	 * @param ctx the parse tree
	 */
	void enterExecute(PDrawGrammarParser.ExecuteContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#execute}.
	 * @param ctx the parse tree
	 */
	void exitExecute(PDrawGrammarParser.ExecuteContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#point}.
	 * @param ctx the parse tree
	 */
	void enterPoint(PDrawGrammarParser.PointContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#point}.
	 * @param ctx the parse tree
	 */
	void exitPoint(PDrawGrammarParser.PointContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#functionDecl}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDecl(PDrawGrammarParser.FunctionDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#functionDecl}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDecl(PDrawGrammarParser.FunctionDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#params}.
	 * @param ctx the parse tree
	 */
	void enterParams(PDrawGrammarParser.ParamsContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#params}.
	 * @param ctx the parse tree
	 */
	void exitParams(PDrawGrammarParser.ParamsContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#param}.
	 * @param ctx the parse tree
	 */
	void enterParam(PDrawGrammarParser.ParamContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#param}.
	 * @param ctx the parse tree
	 */
	void exitParam(PDrawGrammarParser.ParamContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCall(PDrawGrammarParser.FunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#functionCall}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCall(PDrawGrammarParser.FunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#args}.
	 * @param ctx the parse tree
	 */
	void enterArgs(PDrawGrammarParser.ArgsContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#args}.
	 * @param ctx the parse tree
	 */
	void exitArgs(PDrawGrammarParser.ArgsContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#statementBlock}.
	 * @param ctx the parse tree
	 */
	void enterStatementBlock(PDrawGrammarParser.StatementBlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#statementBlock}.
	 * @param ctx the parse tree
	 */
	void exitStatementBlock(PDrawGrammarParser.StatementBlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#dataType}.
	 * @param ctx the parse tree
	 */
	void enterDataType(PDrawGrammarParser.DataTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#dataType}.
	 * @param ctx the parse tree
	 */
	void exitDataType(PDrawGrammarParser.DataTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link PDrawGrammarParser#moves}.
	 * @param ctx the parse tree
	 */
	void enterMoves(PDrawGrammarParser.MovesContext ctx);
	/**
	 * Exit a parse tree produced by {@link PDrawGrammarParser#moves}.
	 * @param ctx the parse tree
	 */
	void exitMoves(PDrawGrammarParser.MovesContext ctx);
}