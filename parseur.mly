%token NUMBER PLUS MINUS TIMES DIVIDE GPAREN DPAREN PV VIR EOL VRAI FAUX EQUAL GREQ NON GRST

%left PLUS MINUS
%left TIMES
%left DIVIDE
%nonassoc UMINUS

%type <unit> main expression commande booleen
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
	| booleen						{}
	;
booleen:
	  VRAI							{}
	| FAUX							{}
	| booleen EQUAL booleen			{}
	| booleen GREQ booleen			{}
	| NON booleen					{}
	| NUMBER						{}
	;
