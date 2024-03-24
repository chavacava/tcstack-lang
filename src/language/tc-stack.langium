grammar TcStack

entry Model:
    instructions += Instruction+;

Instruction:
    Send 
    | Sleep
    ;

Send: 'send' commandName=ID  (arguments = Arguments)? ;
    
Sleep: 'sleep' duration=INT timeUnit=('milliseconds' | 'seconds' | 'minutes') ;

Arguments:
    '(' Argument (',' Argument)* ')' ;

Argument:
    argName=ID '=' argValue=STRING ;

hidden terminal WS: /\s+/;
terminal ID: /[_a-zA-Z][\w_]*/;
terminal STRING: /"[^"]*"/;
terminal INT returns number: /[0-9]+/;

hidden terminal ML_COMMENT: /\/\*[\s\S]*?\*\//;
hidden terminal SL_COMMENT: /\/\/[^\n\r]*/;
