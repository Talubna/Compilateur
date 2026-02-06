{
  open Parseur
  exception Eof
  exception TokenInconnu
}

rule token = parse
  | [' ' '\t' '\r'] { token lexbuf }
  | ['\n']          { EOL }

  (* flottants scientifiques ou décimaux *)
  | ['0'-'9']+ '.' ['0'-'9']* (['e' 'E'] ['+' '-']? ['0'-'9']+)? as f
                    { NUMBER (float_of_string f) }

  (* NaN *)
  | "NaN"           { NUMBER nan }

  (* entiers simples *)
  | ['0'-'9']+ as n { NUMBER (float_of_string n) }

  (* booléens *)
  | "True"          { BOOLEAN true }
  | "False"         { BOOLEAN false }

  (* identifiants *)
  | "import"        { IMPORT }
  | ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '0'-'9' '_']* as id { IDENT id }

  (* opérateurs *)
  | "=="            { EQ }
  | "<="            { LE }
  | "<"             { LT }
  | ">"             { GRST }
  | ">="            { GREQ }
  | "!"             { NOT }
  | '+'             { PLUS }
  | '-'             { MINUS }
  | '*'             { TIMES }
  | '/'             { DIVIDE }

  (* ponctuation *)
  | '('             { GPAREN }
  | ')'             { DPAREN }
  | ';'             { PV }
  | '.'             { VIR }

  (* fin *)
  | eof             { raise Eof }
  | _ as c          { raise TokenInconnu }

