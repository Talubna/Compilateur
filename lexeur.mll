(*fichier lexeur.mll*)
{
  open Parseur
  exception Eof
  exception TokenInconnu
}

rule token = parse

	| [' ' '\t' '\r']	{ token lexbuf }
	| ['\n']			{ EOL }
	
(* Flottants scientifiques : 12.3e-2, 3.14, etc. *)
	| ['0'-'9']+ '.' ['0'-'9']* (['e' 'E'] ['+' '-']? ['0'-'9']+)? as f
    { NUMBER (float_of_string f) }

	(* NaN *)
	| "NaN" 			{ NUMBER nan }

(* Entiers traités comme float pour cohérence *)
	| ['0'-'9']+ as n 		{ NUMBER (float_of_string n) }

	| '+'				{ PLUS }
	| '-'				{ MINUS }
	| '*'				{ TIMES }
	| '/'				{ DIVIDE }
	| '('				{ GPAREN }
	| ')'				{ DPAREN }
	| ';'				{ PV }
	| '.'				{ VIR }
	| eof				{ raise Eof }
	| _					{ raise TokenInconnu }
	| ["True" "False"]	{ BOOLEAN }
	| "=="				{ EQUAL }
	| "<="				{ GREQ }
	| '!'				{ NON }
	| '<'				{ GRST }

| "True"            { BOOLEAN true }
| "False"           { BOOLEAN false }
| "=="              { EQ }
| "<="              { LE }
| "!"               { NOT }
| "<"               { LT }
| [' ' '\t' '\r']   { token lexbuf }
| ['\n']            { EOL }

| '+'               { PLUS }
| '-'               { MINUS }
| '*'               { TIMES }
| '/'               { DIVIDE }
| '('               { GPAREN }
| ')'               { DPAREN }
| ';'               { PV }
| '.'               { VIR }
| eof               { raise Eof }
| _ as c            { raise TokenInconnu }

109d4b5 ( modif)
