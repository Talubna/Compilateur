all : main

main : lexeur.cmo parseur.cmo main.cmo 
	ocamlc -o main lexeur.cmo parseur.cmo main.cmo
	
lexeur.cmo parseur.cmo main.cmo : parseur.mli lexeur.ml parseur.ml main.ml
	ocamlc -c parseur.mli lexeur.ml parseur.ml main.ml

parseur.ml parseur.mli : parseur.mly
	ocamlyacc parseur.mly

lexeur.ml : lexeur.mll
	ocamllex lexeur.mll

clear : 
	rm *.cmi *.cmo main parseur.mli parseur.ml lexeur.ml
