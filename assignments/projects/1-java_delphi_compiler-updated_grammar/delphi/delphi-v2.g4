grammar Delphi;

program: 'program' IDENT '(' IDENT ')' ';' usesClause? varDeclaration? 'begin' statementList 'end' '.';

usesClause: 'uses' IDENT (',' IDENT)* ';';

varDeclaration: 'var' varDecl (varDecl)*;
varDecl: IDENT (',' IDENT)* ':' type_ ';';

type_: 'Integer' | 'String' | 'Boolean' | IDENT;

statementList: statement*;
statement
    : compoundStatement
    | simpleStatement
    ;

compoundStatement
    : 'begin' statementList 'end' ';'
    ;

simpleStatement
    : assignmentStatement
    | methodCall
    | writelnCall
    | loopStatement
    | conditionalStatement
    | 'break' ';'
    | 'continue' ';'
    ;

assignmentStatement: IDENT ':=' expression ';';

methodCall: IDENT '(' argumentList? ')' ';';

writelnCall: 'WriteLn' '(' argumentList? ')' ';';

loopStatement
    : forStatement
    | whileStatement
    | repeatStatement
    ;

forStatement
    : 'for' IDENT ':=' expression 'to' expression 'do' statement
    ;

whileStatement
    : 'while' '(' expression ')' 'do' statement
    ;

repeatStatement
    : 'repeat' statementList 'until' '(' expression ')' ';'
    ;

conditionalStatement
    : ifStatement
    | caseStatement
    ;

ifStatement
    : 'if' '(' expression ')' 'then' statement ('else' statement)?
    ;

caseStatement
    : 'case' expression 'of' caseElement+ 'end' ';'
    ;
caseElement
    : caseLabelList ':' statement
    ;
caseLabelList
    : caseLabel (',' caseLabel)*
    ;
caseLabel
    : expression ('..' expression)?
    ;

expression
    : simpleExpression (relationalOperator simpleExpression)?
    ;

simpleExpression
    : IDENT
    | INTEGER
    | methodCall // for expressions like functions
    ;

relationalOperator
    : '='
    | '<>'
    | '<'
    | '>'
    | '<='
    | '>='
    ;

argumentList: expression (',' expression)*;

INTEGER: [0-9]+;
IDENT: [a-zA-Z_][a-zA-Z_0-9]*;

STRING: '"' ('""'|~'"')* '"';

COLON: ':';
SEMI: ';';
DOT: '.';
COMMA: ',';
LPAREN: '(';
RPAREN: ')';

NEWLINE: '\r'? '\n' -> skip;
WS: [ \t]+ -> skip;