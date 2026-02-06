type commande_a =
      Expr	of expression_a
and expression_a =
    | Plus  of expression_a * expression_a
    | Moins of expression_a * expression_a
    | Mult  of expression_a * expression_a
    | Div 	of expression_a * expression_a
    | Neg   of expression_a
    | Vir	of float * float
    | Num   of float
	| Bool	of bool
    | Egal	of expression_a * expression_a
    | GrEq	of expression_a * expression_a
    | GrSt	of expression_a * expression_a
    | Non	of expression_a
;;


(* Fonctions d'affichage *)

let rec print_commande_e form = let open Format in function
    | Expr	 e    -> fprintf form "@[<2>Exp(%a)\n%a@]" print_expr e code e

and print_expr form = let open Format in function
    | Plus  (g,d) -> print_binaire form "+" g d
    | Moins (g,d) -> print_binaire form "-" g d
    | Mult  (g,d) -> print_binaire form "*" g d
    | Div   (g,d) -> print_binaire form "/" g d
    | Neg    e    -> fprintf form "@[<2>%s@ %a@]" "-'" print_expr e 
    | Vir   (g,d) -> fprintf form "@[<2>%f@ %s%f@]" g "," d
    | Num    n    -> fprintf form "@[<2>Num[%f]@]" n
	| Bool 	 b	  -> fprintf form "@[<2>%B@]" b
    | Egal  (g,d) -> print_binaire form "==" g d
    | GrEq  (g,d) -> print_binaire form ">=" g d
    | GrSt  (g,d) -> print_binaire form ">" g d
    | Non	 e	  -> fprintf form "@[<2>%s@ %a@]" "! " print_expr e 
    
and code form = let open Format in function
	| Num 	 n    -> fprintf form "@[<2>CsteNb%f\n@]" n
	| Plus 	(g,d) -> fprintf form "@[<2>%a%aAddiNb\n@]" code g code d
	| Mult 	(g,d) -> fprintf form "@[<2>%a%aMultNb\n@]" code g code d
	| Moins (g,d) -> fprintf form "@[<2>%a%aSubiNb\n@]" code d code g
	| Neg 	 e	  -> fprintf form "@[<2>%aNegaNb\n@]" code e
	| Div 	(g,d) -> fprintf form "@[<2>%a%aDiviNb\n@]" code d code g
	| Egal	(g,d) -> fprintf form "@[<2>%a%aEquals\n@]" code g code d
	| GrEq	(g,d) -> fprintf form "@[<2>%a%aGrEqNb\n@]" code g code d
	| GrSt	(g,d) -> fprintf form "@[<2>%a%aGrStNb\n@]" code g code d
	| Non 	 e	  -> fprintf form "@[<2>%aNot\n@]" code e
	| Bool 	 b    -> fprintf form "@[<2>CsteNb%B\n@]" b
	
and print_binaire form s g d = Format.fprintf form "@[<2>%s%s@ %a%s@ %a%s@]" s "(" print_expr g " ," print_expr d " )"

;; 

