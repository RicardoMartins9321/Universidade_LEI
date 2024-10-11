grammar StrLang;

program: statement* EOF;

statement: 
    printStat | assignValue
;

expr:
    STRING                              # exprString
    | ID                                # exprID
    | '(' expr ')'                      # exprParentheses
    | 'input' expr                      # exprInput
    | e1=expr '+' e2=expr               # exprConcatenate
    | e1=expr '-' e2=expr               # exprRemove
    | 'trim' expr                       # exprTrim
    | orig=expr '/' targ=expr '/' repl=expr  # exprSubstitute
;

printStat: 'print' (exprList)?;

exprList: expr (',' expr)*;

assignValue: ID ':' expr;

STRING: '"' .*? '"';
ID: [a-zA-Z_][a-zA-Z_0-9]*;
COMMENT: '//' .*? '\n' -> skip;
WS: [ \n\r\t]+ -> skip;
NEWLINE: '\r'? '\n' -> skip;
ERROR: .;
