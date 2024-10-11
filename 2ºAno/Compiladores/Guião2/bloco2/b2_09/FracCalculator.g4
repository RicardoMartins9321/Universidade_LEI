grammar FracCalculator;

program:
    stat* EOF;  // Zero or more repetitions of stat

stat:
    ((print | assignment | readInput) ';')? NEWLINE;

print: 'print' expr;

assignment: expr '->' ID;

readInput: 'read' StringLiteral 'to' ID;

expr:
    <assoc=right> expr '^' Integer  #ExprPow
    |op=('+'|'-'|'reduce') expr     #ExprUnaryReduce
    |expr op=('*'|':') expr         #ExprMultDiv
    |expr op=('+'|'-') expr         #ExprAddSub
    |Integer '/' Integer            #ExprFraction
    |Integer                        #ExprInteger
    |'(' expr ')'                   #ExprParent
    |ID                             #ExprId
    ;

ID : [a-zA-Z]+ ;
Integer : '-'? [0-9]+ ;   // fixed point real number
StringLiteral: '"' ~["]* '"' ;

NEWLINE: '\r'? '\n' ;
WS: [ \t]+ -> skip ;
COMMENT: '#' .* ? '\n' -> skip ;
LINE_COMMENT: '//' ~[\r\n]* -> skip;