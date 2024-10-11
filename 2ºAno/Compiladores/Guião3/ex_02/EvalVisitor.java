package ex_02;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

public class EvalVisitor extends CalculatorBaseVisitor<BigInteger> {
    private Map<String, BigInteger> memory = new HashMap<>();

    @Override
    public BigInteger visitExprUnary(CalculatorParser.ExprUnaryContext ctx) {
        BigInteger val = visit(ctx.expr());
        return ctx.op.getType() == CalculatorParser.MINUS ? val.negate() : val;
    }

    @Override
    public BigInteger visitExprMultDivMod(CalculatorParser.ExprMultDivModContext ctx) {
        BigInteger left = visit(ctx.expr(0));
        BigInteger right = visit(ctx.expr(1));
        switch (ctx.op.getType()) {
            case CalculatorParser.MUL:
                return left.multiply(right);
            case CalculatorParser.DIV:
                return left.divide(right);
            case CalculatorParser.MOD:
                return left.mod(right);
            default:
                throw new UnsupportedOperationException("Operator " + ctx.op.getText() + " is not supported");
        }
    }

    @Override
    public BigInteger visitExprAddSub(CalculatorParser.ExprAddSubContext ctx) {
        BigInteger left = visit(ctx.expr(0));
        BigInteger right = visit(ctx.expr(1));
        return ctx.op.getType() == CalculatorParser.PLUS ? left.add(right) : left.subtract(right);
    }

    @Override
    public BigInteger visitExprInteger(CalculatorParser.ExprIntegerContext ctx) {
        return new BigInteger(ctx.Integer().getText());
    }

    @Override
    public BigInteger visitExprParent(CalculatorParser.ExprParentContext ctx) {
        return visit(ctx.expr());
    }

    @Override
    public BigInteger visitExprID(CalculatorParser.ExprIDContext ctx) {
        String id = ctx.ID().getText();
        return memory.getOrDefault(id, BigInteger.ZERO);
    }

    @Override
    public BigInteger visitExprAssignment(CalculatorParser.ExprAssignmentContext ctx) {
        String id = ctx.ID().getText();
        BigInteger value = visit(ctx.expr());
        memory.put(id, value);
        return value;
    }
}