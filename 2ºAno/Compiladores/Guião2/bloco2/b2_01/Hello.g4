grammar Hello;                          // Define a grammar called Hello

main        : conversation* EOF ;
conversation: greetings | bye ;
greetings   : 'hello' ID+ ;             // match keyword hello followed by an identifier
bye         : 'bye' ID+ ;
ID          : [a-zA-Z]+ ;               // match lower-case and upper-case for one or more letters
WS          : [ \t\r\n]+ -> skip ;      // skip spaces, tabs, newlines, \r (Windows)