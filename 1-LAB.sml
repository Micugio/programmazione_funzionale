(* Es. 1.1 *)
floor(123.45); (* da real a int, per difetto *)
floor(~123.45); (* da real a int, per difetto *)
ceil(123.45); (* da real a int, per eccesso *)
ceil(~123.45); (* da real a int, per eccesso*)

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 1.2 *)
ord(#"Y"); (* da char a int *)
chr(120); (* da int a char *)
chr(round(97.0)); (* da real a int (appros. mate), da int a char *)
real(ord(#"N")); (* da char a int, da int a real *)
str(#"Z"); (* da char a string *)

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* ERRORI COMUNI *)
(*

if true then 5+6 else 7.0; -> tipi diversi nei rami then e else
if 0 then 1 else 2; -> condizione if deve essere un valore bool o un confronto
explode ["bar"]; -> senza parentesi [] -> NOTA: volendo posso usare parentesi ()
implode ( #"a", #"b") ; -> lista di caretteri si scrive con le parentesi []
["r"]::["a","t"]; -> operatore :: non può concatenare due liste, devo usare @


NOTE:
[#"a",#"t"]; -> è una lista di caratteri
["a","t"]; -> è una lista di stringhe
L'operatore :: -> concatena un elemento ad una lista di elementi, entrambi devono essere dello stesso tipo

*)


["r"]@["a","t"];