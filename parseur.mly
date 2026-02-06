%token <float> NUMBER
%token PLUS MINUS DIVIDE TIMES GPAREN DPAREN PV EOL

%left PLUS MINUS
%left TIMES
%nonassoc UMINUS

%type <float> main expression commande
%start main
%%

main:
	  commande EOL					{ $1 }
	;
commande:
	  expression PV					{ $1 }
	;
expression:
	  expression PLUS expression	{ $1+.$3 }
	| expression MINUS expression	{ $1-.$3 }
	| expression DIVIDE expression	{ $1/.$3 }
	| expression TIMES expression	{ $1*.$3 }
	| GPAREN expression DPAREN		{ $2 }
	| MINUS expression %prec UMINUS	{ $2 }
	| NUMBER						{ $1 }
	;
