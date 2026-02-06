%token NUMBER PLUS MINUS TIMES DIVIDE GPAREN DPAREN PV VIR EOL

%left PLUS MINUS
%left TIMES
%nonassoc UMINUS

%type <unit> main expression commande
%start main
%%
main:
	  commande EOL					{}
	;
commande:
	  expression PV					{}
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
	;
