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
    commande EOL            { () }
  ;

commande:
    expression PV          { () }
  ;  

expression:
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

