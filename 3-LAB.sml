(* Es. 3.1 *)
(* Fattoriale *)
fun fact (n) = if n=1 then 1 else n*fact(n-1);

fact (5);

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
fun cycle_prof (l) = tl(l) @ [hd(l)]; (* Funzione ausiliaria per cyclei_prof *)

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

(* Es. 3.4 *)
(* Conta lunghezza della lista *)
(* SENZA PATTERN: *)
fun len (L) = if L=[] then 0 else 1+len(tl(L));

len ([1,2,3,4]);

val _ = print "\n";

(* CON PATTERN: *)
fun lenp (nil) = 0
    | lenp (x::xs) = 1+lenp(xs);

lenp ([1,2,3,4]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.5 *)
(* calcola il numero esponenziale, utente passa il numero e l'esponente *)
fun pow (x, i) = if i=0 then 1.0 else x*pow(x, i-1);

pow (2.2,2);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.6 *)
(* Restituisce la stringa più lunga contenuta nella lista *)
fun maxList (L:string list) = if tl(L)=nil then hd(L)
                                else if hd(L) > hd(tl(L)) then maxList(hd(L)::tl(tl(L)))
                                        else maxList(tl(L));

maxList (["a","abc","ab"]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.7 *)
(* Fattoriale con pattern *)
fun fact_patt 1 = 1
    | fact_patt n = n*fact_patt(n-1);

fact_patt (10);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.8 *)
(* Mette in coda alla lista il primo elemento *)
fun cycle1 (nil) = nil
    | cycle1 (x::xs) = xs@[x];

cycle1 ([1,2,3,4]);

val _ = print "\n";

(* VERSIONE 2: *)

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.9 *)
(* Reverse lista i volte (inserito dall'utente) *)
fun cycleip (0, l) = l
    | cycleip (i, nil) = nil
    | cycleip (i, x::xs) = cycleip(i-1, xs@[x]);

cycleip (3, [#"a",#"b",#"c",#"d",#"e"]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.10 *)
(* Duplica ogni elemento della lista mantenendo ordine *)
(* VERSIONE 1: *)
fun duplicatep_v1 (nil) = nil
    | duplicatep_v1 (x::xs) = [x,x] @ duplicatep_v1(xs);

duplicatep_v1 ([1,2,3,4]);

val _ = print "\n";

(* VERSIONE 2: *)
fun duplicatep_v2 (nil) = nil
    | duplicatep_v2 (x::xs) = x::x::duplicatep_v2(xs);

duplicatep_v2 ([9,8,7,6]);


val _ = print "\n";
(* ---------------------------------------------------------------------------- *)