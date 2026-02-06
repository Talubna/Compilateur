
 HEAD
%token NUMBER PLUS MINUS TIMES DIVIDE GPAREN DPAREN PV VIR EOL BOOLEAN EQUAL GREQ NON GRST

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


%type <unit> main expression commande booleen
%{ 
  (* Prologue : ouvre les modules nécessaires, par ex. *)
  (* open Ast *)
%}

%token <int>    NUMBER
%token           PLUS MINUS TIMES DIVIDE GPAREN DPAREN PV VIR EOL
%token <bool>   BOOLEAN
%token           EQ LE NOT LT

%left   EQ LE LT
%left   PLUS MINUS
%left   TIMES DIVIDE
%right  NOT
%nonassoc UMINUS

%type <unit> main
%type <unit> expression
%type <unit> commande

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

    commande EOL            { () }
  ;

commande:
    expression PV          { () }
  ;  

expression:


    commande EOL            { () }
  ;

commande:
    expression PV          { () }
  ;  

expression:

	  expression PLUS expression	{}
	| expression MINUS expression	{}
	| expression DIVIDE expression	{}
	| expression TIMES expression	{}
	| GPAREN expression DPAREN		{}
	| MINUS expression %prec UMINUS	{}
	| NUMBER VIR NUMBER				{}
	| NUMBER						{}
	| booleen						{}
	;
booleen:
	| BOOLEAN						{}
	| booleen EQUAL booleen			{}
	| booleen GREQ booleen			{}
	| NON booleen					{}
	| NUMBER						{}

	;

    | BOOLEAN                  { () }
    | expression EQ expression { () }
    | expression LE expression { () }
    | expression LT expression { () }
    | NOT expression           { () }
    | expression PLUS expression    { () }
    | expression MINUS expression   { () }
    | expression TIMES expression   { () }
    | expression DIVIDE expression  { () }
    | GPAREN expression DPAREN      { () }
    | MINUS expression %prec UMINUS { () }
    | NUMBER VIR NUMBER             { () }
    | NUMBER                        { () }
  ;

