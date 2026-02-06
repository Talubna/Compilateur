(*fichier lexeur.mll*)
{
  open Parseur
  exception Eof
  exception TokenInconnu
}

rule token = parse
| "True"            { BOOLEAN true }
| "False"           { BOOLEAN false }
| "=="              { EQ }
| "<="              { LE }
| "!"               { NOT }
| "<"               { LT }
| [' ' '\t' '\r']   { token lexbuf }
| ['\n']            { EOL }
| ['0'-'9']+        { NUMBER }
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

