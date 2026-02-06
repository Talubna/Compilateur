(*fichier main.ml*)
let _ =												(*main en OCaml*)
	try
		let lexbuf = Lexing.from_channel stdin in   (*lexeur lancé sur stdin*)
		while true do								(*on ne s'aarête pas*)
			Parseur.main Lexeur.token lexbuf		(*parseur une ligne*)
			|> Printf.printf "%f\n%!";
		done
	with
	| Lexeur.Eof -> exit 0							(*impossible*)
	| Lexeur.TokenInconnu							(*errreur de lexing*)
	| Parsing.Parse_error -> Printf.printf ("Ceci n'est pas une expression arithmétique\n")
													(*erreur de parsing*)
