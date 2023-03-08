/*
 ID: 2013381
 Author: Hồ Đức Hưng 
 Email: hung.hoduccse@hcmut.edu.vn
 */

grammar MT22;

@lexer::header {
from lexererr import *
}

options {
	language = Python3;
}

program: decls+ EOF;

decls: vardecl | funcdecl;

// Array type -------------------------------------------------------------
arraytype: ARRAY LSB dimesion RSB OF eletype;

number: INTLIT | FLOATLIT;
eletype: INTEGER | FLOAT | BOOLEAN | STRING | AUTO;
dimesion: number COMMA dimesion | number;

//Variables ---------------------------------------------------------------
vardecl: vardeclNoEq | vardeclEq;

vardeclNoEq: idlist COLON (eletype | arraytype) SEMI;
vardeclEq:
	IDENTIFIER (
		COMMA assignRecur
		| COLON (eletype | arraytype) EQUAL
	) expr SEMI
;
assignRecur:
	IDENTIFIER (
		COMMA assignRecur
		| COLON (eletype | arraytype) EQUAL
	) expr COMMA
;
arraylist: LCB (explistTerm) RCB;
explistTerm: exprlist |;
idlist: IDENTIFIER COMMA idlist | IDENTIFIER;
exprlist: expr COMMA exprlist | expr;

//Parameters ----------------------------------------------------------------
parameter: (INHERIT |) (OUT |) IDENTIFIER COLON eletype;

// expression declarations --------------------------------------------------
expr: expr1 CONCAT expr1 | expr1;

expr1:
	expr2 (EQUAL_TO | NOT_EQUAL | LESS | GREATER | LTE | GTE) expr2
	| expr2
;
expr2: expr2 (AND | OR) expr3 | expr3;
expr3: expr3 (PLUS | MINUS) expr4 | expr4;
expr4: expr4 (MUL | DIV | MOD) expr5 | expr5;
expr5: NOT expr5 | expr6;
expr6: MINUS expr6 | expr7;
expr7: expr7 factor | expr8;
expr8: (LB expr RB) | factor;
factor:
	INTLIT
	| FLOATLIT
	| STRINGLIT
	| IDENTIFIER
	| funccall
	| arraylist
	| BOOLEANLIT
	| IDENTIFIER LSB (exprlist | factor | expr) RSB
;

// function call ------------------------------------------------------------
funccall: IDENTIFIER LB (exprlist |) RB;

// statement ----------------------------------------------------------------
stmt:
	assignStmt
	| ifStmt
	| forStmt
	| whileStmt
	| doWhileStmt
	| blockStmt
	| returnStmt
	| continueStmt
	| breakStmt
	| callStmt
	| vardecl
;

// assignment statement ------------------------------------------------------
assignStmt: lhs EQUAL expr SEMI;
lhs: IDENTIFIER LSB exprlist RSB | IDENTIFIER;

// if statement --------------------------------------------------------------
ifStmt: (IF expr stmt ELSE stmt) | IF expr stmt;

// for statement -------------------------------------------------------------
forStmt:
	FOR LB (initExpr |) COMMA (conditionExpr |) COMMA (
		updateExpr
		|
	) RB stmt
;
initExpr: IDENTIFIER EQUAL expr;
conditionExpr:
	IDENTIFIER (
		LESS
		| GREATER
		| LTE
		| GTE
		| NOT_EQUAL
		| EQUAL_TO
	) (IDENTIFIER | expr)
;
updateExpr: IDENTIFIER EQUAL expr;

// while statement ------------------------------------------------------------
whileStmt: WHILE LB expr RB stmt;

// Do while statement ---------------------------------------------------------
doWhileStmt: DO blockStmt WHILE expr SEMI;

// call statement -------------------------------------------------------------
callStmt: (funccall | sfuncdecl) SEMI;

// block statement ------------------------------------------------------------
blockStmt: (LCB stmtTerm RCB);
stmtTerm: stmtList |;
stmtList: stmt stmtList | stmt;

//break statement -------------------------------------------------------------
breakStmt: BREAK SEMI;

// continue statement ---------------------------------------------------------
continueStmt: CONTINUE SEMI;

// return statement -----------------------------------------------------------
returnStmt: RETURN (expr |) SEMI;

// Function declarations ------------------------------------------------------
funcdecl:
	IDENTIFIER COLON FUNCTION returnType LB paramterList RB inheritance stmt
;
inheritance: INHERIT function_name |;
function_name: IDENTIFIER;
paramterList: paramterListTerm |;
paramterListTerm: parameter COMMA paramterListTerm | parameter;

returnType: INTEGER | FLOAT | BOOLEAN | STRING | VOID | AUTO;

// Special Functions ------------------------------------------------------------
sfuncdecl:
	read_integer
	| print_integer
	| read_float
	| write_float
	| print_boolean
	| read_string
	| print_string
	| super_
	| prevent_default
;

read_integer: 'readInteger' LB RB;
print_integer:
	'printInteger' LB (INTLIT | IDENTIFIER | expr) RB
;
read_float: 'readFloat' LB RB;
write_float: 'writeFloat' LB (FLOATLIT | IDENTIFIER | expr) RB;
print_boolean:
	'printBoolean' LB (BOOLEANLIT | IDENTIFIER | expr) RB
;
read_string: 'readString' LB RB;
print_string:
	'printString' LB (STRINGLIT | IDENTIFIER | expr) RB
;
super_: 'super' LB exprlist RB;
prevent_default: 'preventDefault' LB RB;

/* --------------------------------------TOKEN------------------------------------------------------- */
COMMENT: (SingleLineComment | MultiLineComment) -> skip;
fragment SingleLineComment: '//' ~('\r' | '\n')*;
fragment MultiLineComment: '/*' .*? '*/';
fragment CommentAll: '/*' .*? EOF;

INTLIT:
	'0'
	| [1-9][0-9]* (UNDERSCORE [0-9]+)* {self.text = self.text.replace("_","")}
;

fragment UNDERSCORE: '_';

FLOATLIT: (
		INTLIT DECPART EXPPART
		| INTLIT DECPART
		| INTLIT EXPPART
		| DECPART EXPPART
	) {self.text = self.text.replace("_","")}
;
fragment DECPART: PERIOD [0-9]*;
fragment EXPPART: [eE] [-+]? [0-9]+;

BOOLEANLIT: FALSE | TRUE;
fragment FALSE: 'false';
fragment TRUE: 'true';

STRINGLIT:
	DUO_QUOTE (~[\n\r\\"] | ESC)* DUO_QUOTE {self.text=str(self.text[1:-1])}
;
fragment NOTESC:
	'\\' ~('b' | 'f' | 'n' | 'r' | 't' | '"' | '\'' | '\\')
;
fragment ESC:
	'\\' ('b' | 'f' | 'n' | 'r' | 't' | '\'' | '\\' | '"')
;
fragment AllEscSeq: '\\' ~["];
fragment DUO_QUOTE: ["];
fragment SINGLE_QUOTE: ['];

AUTO: 'auto';
BREAK: 'break';
INTEGER: 'integer';
VOID: 'void';
ARRAY: 'array';
FLOAT: 'float';
RETURN: 'return';
OUT: 'out';
BOOLEAN: 'boolean';
FOR: 'for';
STRING: 'string';
CONTINUE: 'continue';
DO: 'do';
FUNCTION: 'function';
OF: 'of';
ELSE: 'else';
IF: 'if';
WHILE: 'while';
INHERIT: 'inherit';

PLUS: '+';
MINUS: '-';
MUL: '*';
DIV: '/';
MOD: '%';
LESS: '<';
GREATER: '>';
LTE: '<=';
GTE: '>=';
NOT: '!';
AND: '&&';
OR: '||';
EQUAL_TO: '==';
NOT_EQUAL: '!=';

CONCAT: '::';
PERIOD: '.';
COMMA: ',';
SEMI: ';';
EQUAL: '=';
COLON: ':';
LB: '(';
RB: ')';
LSB: '[';
RSB: ']';
LCB: '{';
RCB: '}';

IDENTIFIER: [a-zA-Z_]+ [a-zA-Z0-9_]*;

WS: [ \t\r\n]+ -> skip; // skip spaces, tabs, newlines

UNCLOSE_STRING:
	DUO_QUOTE (~["] | ESC)*? (
		[\r\n]
		| EOF
	) {
s = self.text
if s[len(s) - 1] == '\n' or s[len(s) - 1] == '\r':
    raise UncloseString(self.text[1:-1])
raise UncloseString(self.text[1:])
}
;
ILLEGAL_ESCAPE:
	DUO_QUOTE (~[\\"] | ESC)* NOTESC {raise IllegalEscape(self.text[1:])
		}
;
ERROR_CHAR: .{raise ErrorToken(self.text)};