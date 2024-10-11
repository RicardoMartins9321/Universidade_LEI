grammar CalComplex;

program: (statement ';')* EOF;

statement: printOutput | assignValue ;

expr: 
    INT                         # exprInt
    | STRING                    # exprString
    | COMPLEX                   # exprComplexNumber
    | ID                        # exprID
    | '(' expr ')'              # exprParentheses
    | op=('+'|'-') expr         # exprUnary
    | e1=expr op=('*'|':') e2=expr # exprMultDiv
    | e1=expr op=('+'|'-') e2=expr # exprAddSub
    | 'input' expr              # exprInput
    | '|' expr '|'           # exprModule
    | 'conj' expr               # exprConjugado

;

printOutput: 'output' (listExpr)?;

listExpr: expr (',' expr)*;

assignValue: expr '=>' ID;


INT: [1-9][0-9]*;
COMPLEX: INT? ('+'|'-')? INT? 'i';
STRING: '"' .*? '"';
ID: [a-zA-Z_][a-zA-Z_0-9]*;
COMMENT: '**' .*? '\n' -> skip;
WS: [ \t\r\n]+ -> skip;
NEWLINE: '\r'? '\n' -> skip;
ERROR: .;