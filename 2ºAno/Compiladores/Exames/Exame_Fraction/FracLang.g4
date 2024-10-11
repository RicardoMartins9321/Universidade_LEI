grammar FracLang;

// parser rules
program:
    (stat ';')* EOF;

stat:
    display 
    | assignValue
;     

expr:
    ID                                  # ExprId                             
    | STRING                            # ExprString                          
    | INT                               # ExprInt
    | FRACTION                          # ExprFraction
    | '(' expr ')'                      # ExprParentheses
    | op=('+' | '-') expr               # ExprUnary
    | e1=expr op=('*' | ':') e2=expr    # ExprMultDiv
    | e1=expr op=('+' | '-') e2=expr    # ExprAddSub
    | 'reduce' expr                     # ExprReduce
    | 'read' STRING                     # ExprRead
;

assignValue:
    ID '<=' expr
;

display:
    'display' expr?
;


INT: [0-9]+;
FRACTION: INT ('/' INT)?;
ID: [a-z_0-9]+;
STRING: '"' .*? '"';
COMMENT: '--' .*? '\n' -> skip;
NEWLINE: '\r'? '\n' -> skip;
WS: [ \t\r\n]+ -> skip; 
ERROR: .;