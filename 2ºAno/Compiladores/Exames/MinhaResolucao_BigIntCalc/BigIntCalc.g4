grammar BigIntCalc;

program: (statement ';')* EOF;

statement: printOutput | assignValue ;

expr: 
    INT                             # exprInt
    | ID                            # exprID
    | '(' expr ')'                  # exprParentheses
    | op=('+'|'-') expr             # exprUnary
    | e1=expr op=('*'|'div') e2=expr  # exprMultDiv
    | e1=expr op=('+'|'-') e2=expr  # exprAddSub
    | e1=expr 'mod' e2=expr         # exprModule
;

printOutput: 'show' (listExpr)?;

listExpr: expr (',' expr)*;

assignValue: expr '->' ID;


INT: [0-9]+;
ID: [a-zA-Z_][a-zA-Z_0-9]*;
COMMENT: '#' .*? '\n' -> skip;
WS: [ \t\r\n]+ -> skip;
NEWLINE: '\r'? '\n' -> skip;
ERROR: .;