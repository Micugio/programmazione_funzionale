(* Es. 3.1 *)
(* Fattoriale *)
fun fact (n) = if n=1 then 1 else n*fact(n-1);

fact (10); (* NOTA: Se n è troppo grande compilatore si blocca perchè operazione troppo complessa e lunga *)

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.2 *)
(* Reverse lista, inserisce in coda l'elemento in testa per n volte *)
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
(* Calcola il numero esponenziale, utente passa il numero e l'esponente *)
fun pow (x, i) = if i=0 then 1.0     (* NOTA: "then 1.0" perchè then e else vogliono lo stesso tipo *)
                 else x*pow(x, i-1);

pow (2.2,2);

(*
VERSIONE SBAGLIATA:
fun pow (x, i:real) = if i = 0.0 then 1.0   //SBAGLIATO perchè operatore "=" non supporta numeri real
              else x*pow(x,i-1.0);

pow(2.1,3);
*)

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.6 *)
(* Restituisce la stringa più lunga contenuta nella lista *)
fun maxList (L:string list) = if tl(L)=nil then hd(L)  (* Si ferma quando mi rimane solo la testa della lista *)
                              else if hd(L) > hd(tl(L)) then maxList(hd(L)::tl(tl(L)))  (* Se 2° if è VERO richiama la funzione scartando la stringa minore confrontata prima *)
                                   else maxList(tl(L));  (* Se 2° if è FALSO richiama la funzione scartando la testa della lista, siccome so che è minore *)

(* NOTA: scrivo annotazione "L:string list" solo per chiarire che lavoro con una lista di stringhe, in realtà l'esercizio funzionerebbe lo stesso *)

maxList (["a","abc","ab","a"]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.7 *)
(* Fattoriale - con Pattern Matching*)
fun fact_patt 1 = 1
    | fact_patt n = n*fact_patt(n-1);

fact_patt (10);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.8 *)
(* Mette in coda alla lista il primo elemento - con Pattern Matching *)
fun cycle1 (nil) = nil
    | cycle1 (x::xs) = xs@[x];

cycle1([1]);
cycle1([1,2,3,4]);

(* VERSIONE più corretta per liste vuote -> esplicita anche il tipo della lista vuota *)
fun cycle1nil (nil:int list) = nil
    | cycle1nil (x::xs) = xs@[x];

cycle1nil([]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.9 *)
(* Reverse lista i volte (inserito dall'utente) - con Pattern Matching *)
fun cycleip (0, l) = l
    | cycleip (i, nil) = nil
    | cycleip (i, x::xs) = cycleip(i-1, xs@[x]);

cycleip (3, [#"a",#"b",#"c",#"d",#"e"]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.10 *)
(* Duplica ogni elemento della lista mantenendo ordine - con Pattern Matching *)
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

(* Es. 3.11 *)
(* Calcola il numero esponenziale, utente passa il numero e l'esponente - con Pattern Matching *)
fun power (x, 0) = 1.0
    | power (x, i) = x*power(x, i-1);

power(2.1,3);

(*
VERSIONE SBAGLIATA:
fun power (x, 0) = 1.0
  | power (0.0, i) = 0.0  //ERRORE: il ML non si possono confrontare con "=" due numeri real (2.1 = 0.0 ERRORE). Inoltre la riga è inutile, non serve controllarla perchè se la "x" è 0 poi la moltiplicazione delle "x" risulterà 0.
  | power (x, i) = x * power(x, i - 1);

power(2.1,3);
*)

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 3.12 *)
(* Restituisce la stringa più lunga contenuta nella lista - con Pattern Matching *)
(* VERSIONE per lista di real *)
fun maxListPr (nil) = nil
    | maxListPr ((x::nil):real list) = [x]
    | maxListPr (x::xs) = if x > hd(xs) then maxListPr(x::tl(xs)) else maxListPr(xs);

maxListPr ([2.0]);
maxListPr ([2.0,5.1,4.2]);
maxListPr ([2.0,5.1,4.2,2.5]);

(* VERSIONE per lista di string *)
fun maxListPs (nil) = nil
    | maxListPs ((x::nil):string list) = [x]
    | maxListPs (x::xs) = if x > hd(xs) then maxListPs(x::tl(xs)) else maxListPs(xs);

maxListPs (["a","abc","ab","c"]);

(* VERSIONE PROF (per lista di real) *)
fun maxListPROF(nil) = nil
    | maxListPROF([x:real]) = [x]  (* NOTA: [x:real] -> è una lista con all'interno un solo numero real QUINDI se la lista ha un numero real tutta la lista è una lista di numeri real *)
    | maxListPROF(x::y::zs) = if x > y then maxListPROF(x::zs) else maxListPROF(y::zs);

(* NOTA: In ML ( [x:real] == [x]:real list ) *)
maxListPROF ([2.0,5.1,4.2]);

(* VERSIONE di Piamarta (per lista di string) *)
fun maxListPIA [] = ""
  | maxListPIA x = if hd(x) > maxListPIA(tl(x)) then hd(x) else maxListPIA(tl(x));

maxListPIA(["a","abc","ab"]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)