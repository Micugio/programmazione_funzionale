(* Es. 4.1 *)
(* Inverte, a due a due, elementi della lista *)
fun flip (nil) = nil
    | flip ([x]) = [x]
    | flip (x::y::zs) = y::x::flip(zs);

flip ([1,2,3,4,5]);
flip ([1,2,3,4]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 4.2 *)
(* Rimuove elemento in posizione i-esima dalla lista *)
fun remove (nil,i) = nil
    | remove (x::xs,1) = xs
    | remove (x::xs,i) = x :: remove(xs,i-1);

remove ([1],1);
remove ([1,2],3);
remove ([1,2,3],3);
remove ([1,2,3,4],3);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 4.3 *)
(* Calcola il quadrato di un numero inserito dall'utente (per il calcolo usa questa formula: [n^2 = (n-1)^2 + 2*n - 1] ) *)
fun squarePROF (0) = 0
    | squarePROF (n) = squarePROF(n-1) + 2*n - 1;

squarePROF(2);
squarePROF(5);
squarePROF(0);

(* LA MIA VERSIONE NON RICORSIVA - con Pattern Matching *)
fun square (0) = 0
    | square (n) = (n-1)*(n-1) + 2*n - 1;

square(2);
square(5);
square(0);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 4.4 *)
(* Data una lista di tuple, ordina gli elementi all'interno delle tuple *)
fun flip (nil) = nil
    | flip (x as (a:int,b) :: xs ) = if a>b then (b,a)::flip(xs) else (a,b)::flip(xs);

flip([(1,2),(4,3)]);
flip[(5,2),(4,3),(6,5),(1,2)];
flip([(1,1),(1,2)]);
flip(nil);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 4.5 *)
(* Data una lista di caratteri, restituisce TRUE se il primo elemento della lista è una vocale, altrimenti FALSE *)
fun vowel (#"a"::xs) = true
    | vowel (#"e"::xs) = true
    | vowel (#"i"::xs) = true
    | vowel (#"o"::xs) = true
    | vowel (#"u"::xs) = true
    | vowel (_) = false; (* NOTA: "_" = qualsiasi altro valore restituisce FALSE -> Condizione da mettere in fondo altrimenti per tutti i valore restiuisce FALSE *)

vowel([#"a",#"b"]);
vowel([#"b",#"c"]);
vowel([#"a"]);
vowel([#"i",#"b"]);
vowel(nil);

(* VERSIONE COMPATTA (non efficiente) - con anche orelse *)
fun vowelOR (nil) = false
    | vowelOR (x::xs) = if ((x = #"a") orelse (x = #"e") orelse (x = #"i") orelse (x = #"o") orelse (x = #"u")) then true else false;

vowelOR([#"a",#"b"]);
vowelOR([#"b",#"c"]);
vowelOR([#"a"]);
vowelOR([#"i",#"b"]);
vowelOR(nil);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 4.6 *)
(* Dati un valore e un insieme rappresentato come lista, controllare se il valore appartiene alla lista e restituisce TRUE o FALSE *)
fun member (n,nil) = false
    | member (n,x::xs) = if n = x then true else member(n,xs);

member(1,[2,3]);
member(2,[2,3,1]);
member(5,nil);
member("b",["aa","c"]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 4.7 *)
(* Dati un valore e una lista di valori, se il valore è contenuto nella lista lo elimina da essa, altrimenti restituisce la lista originaria *)
fun delete (n,nil) = nil
    | delete (n,x::xs) = if n = x then xs else x::delete(n,xs); (* NOTA: scrivo "x::delete(n,xs)" perchè siccome il x non lo voglio eliminare allora lo concateno al ritorno dalla ricorsione per non perderlo *)

delete(1,[2,3,4]);
delete(1,[2,1,3]);
delete(1,nil);
delete(#"b",[#"c",#"b",#"a"]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 4.8 *)
(* Dati un valore e una lista di valori, inserisce in fondo alla lista il valore se non è già presente all'interno della lista *)
fun insert (n,nil) = [n]
    | insert (n,x::xs) = if n <> x then x::insert(n,xs) else x::xs;

(*
VERSIONE SBAGLIATA: 
fun insert (n,nil) = [n]
    | insert (n,x::nil) = x::[n]   // Questo caso è superfluo e sbagliato, se l'elementoe da aggiungere è già presente nell'ultima posizione questa funzione lo aggiunge comunque SBAGLIANDO!
    | insert (n,x::xs) = if n <> x then x::insert(n,xs) else x::xs;
*)

insert(2,[3,4,5]);
insert(3,[3,4,5]);
insert(2,nil);
insert(#"a",[#"b",#"c"]);

(* VERSIONE PROF *)
fun insertPROF (x,nil) = [x] 
    | insertPROF (x,S as y::ys) = if x=y then S else y::insertPROF(x,ys);

insertPROF(2,[3,4,5]);
insertPROF(3,[3,4,5]);
insertPROF(2,nil);
insertPROF(#"a",[#"b",#"c"]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 4.9 *)
(* Dati un valore e una lista di liste, inserisce in cima ad ogni sottolista il valore passato *)
fun insertAll (n,nil) = nil
    | insertAll (n,x::xs) = (n::x)::insertAll(n,xs); 

(* NOTA: l'operatore cons (::) al centro non fonde le sottoliste in una lista unica. 
         In pratica prima metto in testa n alla mia sottolista x e poi la lista risultante da questa operazione la metto in testa alla mia lista di liste. *)

insertAll(1,[[2,3],[],[3]]);
insertAll(1,nil);
insertAll(#"c",[[#"a",#"t"],[#"a",#"r"],nil]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 4.10 *)
(* Dati un valore e una lista di liste, inserisce in cima ad ogni lista della lista il valore passato *)
fun powerSet(nil) = [nil] 
    | powerSet(x::xs) = powerSet(xs)@insertAll(x,powerSet(xs));

powerSet([6,7]);
powerSet([1,2,3]);
powerSet([#"a",#"c"]);
powerSet(nil); (* DA CONSEGNA: Non serve correggere errore di tipo *)

(* VERSIONE LEONARDO SPARANO (LS) *)
fun powerSetRLS nil = nil
  | powerSetRLS (x::xs) = [x]::powerSetRLS(xs)@insertAll(x, powerSetRLS(xs));

fun powerSetLS nil = [[]]
  | powerSetLS (L) = [[]]@powerSetRLS(L);

powerSet([1,2,3]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 4.11 *)
(* Data una lista di numeri real, eseguire la produttoria a coppie tra tutti gli elementi della lista *)
fun prodDiff1(_,nil) = 1.0
    | prodDiff1(a,b::bs) = (a-b)*prodDiff1(a,bs);

fun prodDiff(nil) = 1.0
    | prodDiff(b::bs) = prodDiff1(b,bs)*prodDiff(bs);

prodDiff([1.0,2.0,3.0]);
prodDiff(nil);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 4.12 *)
(* Dato un valore, restituisce "one" se è 1 altrimenti "anything else"*)
(* VERSIONE con Pattern Matching + Case *)
fun is_onePC (x) = case (x) of 
    1 => "one" 
    |_ => "anything else";

is_onePC(1);
is_onePC(3);

val _ = print "\n";

(* VERSIONE con SOLO Pattern Matching *)
fun is_oneP(1) = "one"
    | is_oneP(_) = "anything else";

is_oneP(1);
is_oneP(3);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)