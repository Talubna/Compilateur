type token =
  | NUMBER of (int)
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | GPAREN
  | DPAREN
  | PV
  | VIR
  | EOL
  | BOOLEAN of (bool)
  | EQ
  | LE
  | NOT
  | LT

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> unit
