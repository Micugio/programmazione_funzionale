(* Es. 3.1 *)
(* Fattoriale *)
fun fact (n) = if n=1 then 1
                else n*fact(n-1);

fact (10);

val _ = print "\n";

(* Fattoriale con pattern *)
fun fact_patt 1 = 1
    | fact_patt n = n*fact_patt(n-1);

fact_patt (10);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.2 *)
(* Reverse lista e inserisci in coda l'elemento al posto n *)
(* LA MIA VERSIONE *)
fun cyclei (n, l) = if n=0 then l
                else cyclei(n-1, tl(l)@[hd(l)]);

cyclei (2, [1,2,3,4]);

val _ = print "\n";

(* VERSIONE PROF *)
fun cycle_prof (l) = tl(l) @ [hd(l)];

fun cyclei_prof (i, l) = if i=0 then l
                else cyclei_prof(i-1, cycle_prof(l));

cyclei_prof (2, [1,2,3,4]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.3 *)
(* Duplica in ordine tutti gli elementi della lista *)
fun duplicate (L) = if L=[] then []
                else [hd(L),hd(L)] @ duplicate(tl(L));

duplicate ([1,2,3,4]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)