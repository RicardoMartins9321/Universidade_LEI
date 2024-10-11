grammar SuffixCalculator;
program:
        stat* EOF       // Zero or more repetitions of stat
    ;
stat:
        expr? NEWLINE   // Optative expr followed be and end-of-line
    ;
expr:
        expr expr op=('*'|'/'|'+'|'-')  #ExprSuffix
    |   Number                          #ExprNumber
    ;
Number: [0-9]+('.'[0-9]+)?; // fixed point real number
NEWLINE: '\r'? '\n';
WS: [ \t]+ -> skip;
