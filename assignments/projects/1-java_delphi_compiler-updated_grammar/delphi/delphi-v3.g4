grammar delphi;

program: 'program' IDENT '(' IDENT ')' ';' classDeclaration* constructorImplementation* destructorImplementation* methodImplementation* functionImplementation* variableDeclaration* 'begin' statement* 'end' '.';

classDeclaration: 'type' IDENT '=' 'class'
                  (visibilitySection)*
                  'end' ';';

visibilitySection: ('public' | 'private') memberDeclaration*;

memberDeclaration: constructorDeclaration
                  | destructorDeclaration
                  | methodDeclaration
                  | fieldDeclaration
                  | functionDeclartion;

constructorDeclaration: 'constructor' IDENT ';';

destructorDeclaration: 'destructor' IDENT ';';

constructorImplementation: 'constructor' IDENT '.' IDENT ';' 'begin' statement* 'end' ';';

destructorImplementation: 'destructor' IDENT '.' IDENT ';' 'begin' statement* 'end' ';';

methodDeclaration: 'procedure' IDENT ';';

functionDeclartion: 'function' IDENT ':' type_ ';';

methodImplementation: 'procedure' IDENT '.' IDENT ';' 'begin' statement* 'end' ';';

functionImplementation: 'function' IDENT '.' IDENT ':' type_ ';' 'begin' statement* 'end' ';';

fieldDeclaration: IDENT ':' type_ ';';

variableDeclaration: 'var' varDeclList;

varDeclList: varDecl (varDecl)*;

varDecl: IDENT (',' IDENT)* ':' type_ ';' ;

type_: 'Integer' | 'String' | 'Boolean' | IDENT;

statement: variableAssignment
         | assignment
         | methodCall
         | writelnCall
         | variableDeclaration
         | whileStatement
         | forStatement
         | breakStatement
         | continueStatement;

variableAssignment: IDENT ':=' expression ';';

assignment: IDENT ':=' expression ';'
          | IDENT ':=' expression ;

methodCall: IDENT '.' IDENT ('(' expression? ')')? (';'|NEWLINE);

writelnCall: 'WriteLn' '(' expression ')' ';';

objectCreation: IDENT '.' IDENT '('? ')'?;

whileStatement: 'while' IDENT '=' INTEGER 'do' 'begin' statement* 'end' ';'; 

forStatement: 'for' assignment 'to' IDENT 'do' 'begin' statement* 'end' ';';

breakStatement: 'break' ';';

continueStatement: 'continue' ';';

expression: simpleExpression
          | expression relationaloperator expression;
        
simpleExpression: IDENT 
                | INTEGER
                | objectCreation;

relationaloperator
    : EQUAL
    | NOT_EQUAL
    ;

IDENT: [a-zA-Z_][a-zA-Z_0-9]*;
INTEGER: [0-9]+;
COLON: ':';
SEMI: ';';
NEWLINE: '\r'? '\n' -> skip;
WS: [ \t]+ -> skip;
EQUAL: '=';
NOT_EQUAL: '<>';