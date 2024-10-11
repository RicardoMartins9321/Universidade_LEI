grammar Calculator;

program:
        stat* EOF       // Zero or more repetitions of stat
    ;
stat:
        assignment NEWLINE
        expr? NEWLINE       // Optative expr followed be and end-of-line
    ;
assignment:
    ID '=' expr                     #ExprAssignment
    ;

expr:
        op=('+'|'-') expr           #ExprUnary
    |   expr op=('*'|'/'|'%') expr  #ExprMultDivMod
    |   expr op=('+'|'-')           #ExprAddSub
    |   Integer                     #ExprInteger
    |   '(' expr ')'                #ExprParent
    |   ID                          #ExprID
    ;

ID: [a-zA-Z_]+;
Integer: [0-9]+; // fixed point real number
NEWLINE: '\r'? '\n';
WS: [ \t]+ -> skip;
COMMENT: '#' .*? '\n' -> skip;