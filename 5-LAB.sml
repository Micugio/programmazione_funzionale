(* Es. 5.8 *)

(* PER SOLUZIONE: *)
    (* X vedi FOTO*)
    (* X SLIDE SOL -> NOTA: seconda riga ERRORE: no (0,x) MA (x,0) *)
    (* X vedi CHAT con CLAUDE *)

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 5.10*)
(* Calcolo Combinatorio *)
fun fact 0 = 1
    | fact n = n*fact(n-1);

fun comb (n,m) = (print("n is "); print(Int.toString(n)); print("\n");
                  print("m is "); print(Int.toString(m)); print("\n");
                  print("Result is "); print(Int.toString(fact(n) div (fact(m)*fact(n-m)))); print("\n"));
(* NOTA: print stampa una stringa ma io voglio stampare n che è un numero quindi lo trasformo in stringa con Int.toString *)

comb (5,2);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 5.11*)
(* VERSIONE ESPONENZIALE (ORIGINALE): *)
(* Print X, quantità 2^n *)
fun printXs 0 = print("X")
    | printXs n = (printXs(n-1); printXs(n-1));

printXs (3);

(* VARIANTE: *)
(* Print X, quantità n *)
fun printX 0 = (print(""); print ("\n"))
    | printX n = (print("X"); printX(n-1));

printX (8);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)