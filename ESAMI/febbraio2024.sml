(* 
---------------------- Esame pratico dell'appello di febbraio 2024 (13/02/2024) ----------------------

Si scriva una funzione prefix che riceve come argomento una stringa e restituisce una lista di stringhe contenente tutti i prefissi della stringa.

Es: "Ciao" -> ["Ciao","Cia","Ci,"C"] 
(no la stringa vuota)

Consiglio: nella consegna originale si consigliava di usare la funzione "map", ma questa soluzione non la usa.
*)

fun rev(nil) = nil
    | rev(x::xs) = rev(xs)@[x];

fun prefix1(nil) = nil
    | prefix1(L as x::xs) = implode(rev(L))::prefix1(xs);

fun prefix(stringa) = prefix1(rev(explode(stringa)));

prefix("Ciao");