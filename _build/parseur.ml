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

open Parsing;;
let _ = parse_error;;
# 1 "parseur.mly"
 
  (* Prologue : ouvre les modules nécessaires, par ex. *)
  (* open Ast *)
# 25 "parseur.ml"
let yytransl_const = [|
  258 (* PLUS *);
  259 (* MINUS *);
  260 (* TIMES *);
  261 (* DIVIDE *);
  262 (* GPAREN *);
  263 (* DPAREN *);
  264 (* PV *);
  265 (* VIR *);
  266 (* EOL *);
  268 (* EQ *);
  269 (* LE *);
  270 (* NOT *);
  271 (* LT *);
    0|]

let yytransl_block = [|
  257 (* NUMBER *);
  267 (* BOOLEAN *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\000\000"

let yylen = "\002\000\
\002\000\002\000\001\000\003\000\003\000\003\000\002\000\003\000\
\003\000\003\000\003\000\003\000\002\000\003\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\003\000\000\000\016\000\
\000\000\000\000\000\000\013\000\000\000\007\000\000\000\000\000\
\000\000\000\000\002\000\000\000\000\000\000\000\001\000\014\000\
\012\000\000\000\000\000\010\000\011\000\000\000\000\000\000\000"

let yydgoto = "\002\000\
\008\000\009\000\010\000"

let yysindex = "\001\000\
\076\255\000\000\001\255\076\255\076\255\000\000\076\255\000\000\
\031\255\005\255\022\255\000\000\045\255\000\000\076\255\076\255\
\076\255\076\255\000\000\076\255\076\255\076\255\000\000\000\000\
\000\000\004\255\004\255\000\000\000\000\002\255\002\255\002\255"

let yyrindex = "\000\000\
\000\000\000\000\017\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\059\255\073\255\000\000\000\000\084\255\093\255\102\255"

let yygindex = "\000\000\
\000\000\252\255\000\000"

let yytablesize = 117
let yytable = "\012\000\
\013\000\001\000\014\000\015\000\016\000\017\000\018\000\017\000\
\018\000\011\000\026\000\027\000\028\000\029\000\023\000\030\000\
\031\000\032\000\015\000\015\000\015\000\015\000\024\000\015\000\
\015\000\000\000\000\000\000\000\015\000\015\000\000\000\015\000\
\015\000\016\000\017\000\018\000\000\000\000\000\019\000\000\000\
\000\000\000\000\020\000\021\000\000\000\022\000\015\000\016\000\
\017\000\018\000\000\000\025\000\000\000\000\000\000\000\000\000\
\020\000\021\000\000\000\022\000\008\000\008\000\000\000\000\000\
\000\000\008\000\008\000\000\000\000\000\000\000\008\000\008\000\
\000\000\008\000\009\000\009\000\003\000\000\000\004\000\009\000\
\009\000\005\000\000\000\000\000\009\000\009\000\006\000\009\000\
\000\000\007\000\004\000\004\000\000\000\000\000\000\000\004\000\
\004\000\000\000\004\000\005\000\005\000\000\000\000\000\000\000\
\005\000\005\000\000\000\005\000\006\000\006\000\000\000\000\000\
\000\000\006\000\006\000\000\000\006\000"

let yycheck = "\004\000\
\005\000\001\000\007\000\002\001\003\001\004\001\005\001\004\001\
\005\001\009\001\015\000\016\000\017\000\018\000\010\001\020\000\
\021\000\022\000\002\001\003\001\004\001\005\001\001\001\007\001\
\008\001\255\255\255\255\255\255\012\001\013\001\255\255\015\001\
\002\001\003\001\004\001\005\001\255\255\255\255\008\001\255\255\
\255\255\255\255\012\001\013\001\255\255\015\001\002\001\003\001\
\004\001\005\001\255\255\007\001\255\255\255\255\255\255\255\255\
\012\001\013\001\255\255\015\001\002\001\003\001\255\255\255\255\
\255\255\007\001\008\001\255\255\255\255\255\255\012\001\013\001\
\255\255\015\001\002\001\003\001\001\001\255\255\003\001\007\001\
\008\001\006\001\255\255\255\255\012\001\013\001\011\001\015\001\
\255\255\014\001\007\001\008\001\255\255\255\255\255\255\012\001\
\013\001\255\255\015\001\007\001\008\001\255\255\255\255\255\255\
\012\001\013\001\255\255\015\001\007\001\008\001\255\255\255\255\
\255\255\012\001\013\001\255\255\015\001"

let yynames_const = "\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  GPAREN\000\
  DPAREN\000\
  PV\000\
  VIR\000\
  EOL\000\
  EQ\000\
  LE\000\
  NOT\000\
  LT\000\
  "

let yynames_block = "\
  NUMBER\000\
  BOOLEAN\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : unit) in
    Obj.repr(
# 25 "parseur.mly"
                            ( () )
# 142 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : unit) in
    Obj.repr(
# 29 "parseur.mly"
                           ( () )
# 149 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 33 "parseur.mly"
                               ( () )
# 156 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : unit) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 34 "parseur.mly"
                               ( () )
# 164 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : unit) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 35 "parseur.mly"
                               ( () )
# 172 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : unit) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 36 "parseur.mly"
                               ( () )
# 180 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 37 "parseur.mly"
                               ( () )
# 187 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : unit) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 38 "parseur.mly"
                                    ( () )
# 195 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : unit) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 39 "parseur.mly"
                                    ( () )
# 203 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : unit) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 40 "parseur.mly"
                                    ( () )
# 211 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : unit) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 41 "parseur.mly"
                                    ( () )
# 219 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : unit) in
    Obj.repr(
# 42 "parseur.mly"
                                    ( () )
# 226 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : unit) in
    Obj.repr(
# 43 "parseur.mly"
                                    ( () )
# 233 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 44 "parseur.mly"
                                    ( () )
# 241 "parseur.ml"
               : unit))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 45 "parseur.mly"
                                    ( () )
# 248 "parseur.ml"
               : unit))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : unit)
