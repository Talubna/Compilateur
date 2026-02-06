(*fichier lexeur.mll*)
{
	open Parseur
	exception Eof
	exception TokenInconnu
}
rule token = parse
	  [' ' '\t' '\r']	{ token lexbuf }
	| ['\n']			{ EOL }
	| ['0'-'9']+		{ NUMBER }
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
	| "True"			{ VRAI }
	| "False"			{ FAUX }
	| "=="				{ EQUAL }
	| "<="				{ GREQ }
	| '!'				{ NON }
	| '<'				{ GRST }
