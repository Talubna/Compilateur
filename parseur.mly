%{
	open AST
%}

%token NUMBER PLUS MINUS TIMES DIVIDE GPAREN DPAREN PV VIR EOL BOOLEAN EQUAL GREQ NON GRST
%token <float> NUMBER
%token <bool> BOOLEAN
%left PLUS MINUS
%left TIMES DIVIDE
%left EQUAL GREQ GRST
%nonassoc UMINUS NON

%type <AST.commande_a> main commande
%type <AST.expression_a> expression

%start main
%%
main:
	  commande EOL					{ $1 }
	;
commande:
	  expression PV					{ Expr ($1) }
	;	
expression:
	  expression PLUS expression	{ Plus ($1,$3) }
	| expression MINUS expression	{ Moins ($1,$3) }
	| expression DIVIDE expression	{ Div ($1,$3) }
	| expression TIMES expression	{ Mult ($1,$3) }
	| expression DIVIDE expression	{ Div ($1,$3) }
	| GPAREN expression DPAREN		{ $2 }
	| MINUS expression %prec UMINUS	{ Neg $2 }
	| NUMBER						{ Num($1) }
	| BOOLEAN						{ Bool($1) }
	| expression EQUAL expression	{ Egal($1,$3) }
	| expression GREQ expression	{ GrEq($1,$3) }
	| expression GRST expression	{ GrSt($1,$3) }
	| NON expression				{ Non $2 }
	;
