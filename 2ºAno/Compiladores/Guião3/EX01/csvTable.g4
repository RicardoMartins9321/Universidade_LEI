grammar csvTable;

program: stat*;

stat: expr '\n'|expr EOF;

expr:  
     expr ',' expr #ExprRec
     |String1      #ExprStr;

String1: [a-zA-Z_0-9]+;
Ignore: [\t\r]+->skip;