all : main

main : lexeur.cmo parseur.cmo main.cmo AST.cmo
	ocamlc -o main AST.cmo lexeur.cmo parseur.cmo main.cmo
	
lexeur.cmo parseur.cmo main.cmo AST.cmo : parseur.mli lexeur.ml parseur.ml main.ml
	ocamlc -c AST.ml parseur.mli lexeur.ml parseur.ml main.ml

parseur.ml parseur.mli : parseur.mly
	ocamlyacc parseur.mly

lexeur.ml : lexeur.mll
	ocamllex lexeur.mll

clear : 
	rm *.cmi *.cmo main parseur.mli parseur.ml lexeur.ml
