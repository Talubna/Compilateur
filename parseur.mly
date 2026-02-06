
%token NUMBER PLUS MINUS TIMES DIVIDE GPAREN DPAREN PV VIR EOL BOOLEAN EQUAL GREQ NON GRST

%token <float> NUMBER
%token <bool> BOOLEAN
%token <string> IDENT

%token PLUS MINUS TIMES DIVIDE
%token GPAREN DPAREN PV VIR EOL
%token EQ LE LT NOT

%left EQ LE LT
%left PLUS MINUS
%left TIMES DIVIDE
%right NOT
%nonassoc UMINUS

%type <unit> main
%type <unit> expression
%type <unit> commande
%start main

%%

main:
    commande EOL { () }
  ;

commande:
    expression PV { () }
  ;

expression:
    expression PLUS expression     { () }
  | expression MINUS expression    { () }
  | expression TIMES expression    { () }
  | expression DIVIDE expression   { () }
  | expression EQ expression       { () }
  | expression LE expression       { () }
  | expression LT expression       { () }
  | NOT expression                 { () }
  | MINUS expression %prec UMINUS  { () }
  | GPAREN expression DPAREN       { () }
  | NUMBER VIR NUMBER              { () }
  | NUMBER                         { () }
  | BOOLEAN                        { () }
  | IDENT                          { () }
  ;

