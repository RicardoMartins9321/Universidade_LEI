grammar QuestionGrammar;

// Parser rules
file: (line | COMMENT)* EOF;

line: question | group;

question: ID '(' TEXT ')' '{' (answer ';')+ '}';

answer: TEXT ':' INTEGER;

group: '#' TEXT ':' TEXT '{' (question | COMMENT)* '}';


// Lexer rules
ID: [a-zA-Z0-9.]+;
TEXT: '"' (~["])* '"';
INTEGER: [0-9]+;
WS: [ \t\r\n]+ -> skip;
COMMENT: '#' .* ? '\n' -> skip ;
LINE_COMMENT: '//' ~[\r\n]* -> skip;
