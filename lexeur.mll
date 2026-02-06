(*fichier lexeur.mll*)
{
	open Parseur
	exception Eof
	exception TokenInconnu
}
rule token = parse
	  [' ' '\t' '\r']	{ token lexbuf }
	| ['\n']			{ EOL }
	| ['0'-'9']+		as lexem { NUMBER(int_of_string lexem) }
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
	| "True"			{ BOOLEAN(true) }
	| "False"			{ BOOLEAN(false) }
	| "=="				{ EQUAL }
	| ">="				{ GREQ }
	| '!'				{ NON }
	| '>'				{ GRST }
