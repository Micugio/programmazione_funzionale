(* Es. 5.1 *)
(* Se il valore è inferiore a 5, allora 1, altrimenti 2 (con costrutto case) *)
fun is_lower_than5 (x) = case (x<5) of 
    true => 1
    |false => 2;

is_lower_than5(3);
is_lower_than5(6);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 5.2 *)
(* Calcolare x^1000 (con costrutto let...in...end) *)
fun thousandthPower(x:real) = 
    let
        val x = x*x*x*x*x; (* x^5 *)
        val x = x*x*x*x*x; (* (x^5)*(x^5)*(x^5)*(x^5)*(x^5)= (x^5)^5 = x^25 *)
        val x = x*x*x*x*x (* (x^25)*(x^25)*(x^25)*(x^25)*(x^25) = (x^25)^5 = x^125 *)
    in 
        x*x*x*x*x*x*x*x (* (x^125)*(x^125)*(x^125)*(x^125)*(x^125)*(x^125)*(x^125)*(x^125) = (x^125)^8 = x^1000 *)
    end;

thousandthPower(1.0);
thousandthPower(1.1);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 5.3 *)
(* Slitta tuple (con let...in...end) *)
(* COSA FA? L'obiettivo della funzione split è prendere una singola lista e 
            "spaccarla" in due liste separate, alternando gli elementi (il primo 
            va nella prima lista, il secondo nella seconda, il terzo nella prima, 
            e così via). Il risultato finale è una tupla contenente le due nuove liste.   *)
(* VERSIONE ORIGINALE: *)
fun split(nil) = (nil,nil)
    | split([a]) = ([a],nil)
    | split(a::b::cs) = let
                            val(M,N) = split(cs);
                        in
                            (a::M,b::N)
                        end;

split([1,2,3,4]);
split([5,6,7,8,9]);
split([22,0]);
split([6,7,8]);
split([10]);

val _ = print ("\n");

(* VERSIONE chiesta dall'ESERCIZIO: *)
fun splitNew(nil) = (nil,nil) 
    | splitNew([a]) = ([a],nil)
    | splitNew(a::b::cs) = let
                                val x = splitNew(cs); 
                                val M = #1 x; 
                                val N = #2 x
                           in
                                (a::M,b::N)
                           end;

splitNew([1,2,3,4]);
splitNew([5,6,7,8,9]);
splitNew([22,0]);
splitNew([6,7,8]);
splitNew([10]);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 5.4 *)
(* Funzione PowerSet (con let...in...end) *)
(* COSA FA? Data una lista (vista come un insieme), restituire l'insieme delle parti 
            (sotto forma di lista di liste), cioè tutti i possibili insiemi che si 
            possono generale dall'insieme iniziale    *)
(* insertAll = dati un valore e una lista di liste, inserisce in cima ad ogni sottolista il valore passato *)
fun insertAll (n,nil) = nil
    | insertAll (n,x::xs) = (n::x)::insertAll(n,xs); 

(* NOTA: l'operatore cons (::) al centro non fonde le sottoliste in una lista unica. 
         In pratica prima metto in testa n alla mia sottolista x e poi la lista risultante da questa operazione la metto in testa alla mia lista di liste. *)

fun powerSet(nil) = [nil]
    | powerSet(x::xs) = let
                            val L = powerSet(xs)
                        in
                            L @ insertAll(x,L)
                        end;

powerSet([6,7]);
powerSet([1,2,3]);
powerSet([#"a",#"c"]);
powerSet(nil); (* DA CONSEGNA: Non serve correggere errore di tipo *)

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 5.5 *)
(* Data una lista di coppie (cioè tuple) di numeri interi, restituire una tupla contente la somma di tutti i primi elementi e la somma di tutti i secondi elementi *)

fun sumPairs(nil) = [(0,0)]
    | sumPairs(x as (a:int,b)::xs) = let
    (*
                            val ric = sumPairs(xs);
                            val A = a+ric;
                            val B = b+ric*)
                            val (A,B) = sumPairs(xs);
                        in
                            [(a+A,b+B)]
                        end;

sumPairs([(1,2),(3,4),(5,6)]);
sumPairs([]);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 5.6 *)
(* fghfhgf *)



val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 5.7 *)
(* fghfhgf *)



val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 5.8 *)

(* PER SOLUZIONE: *)
    (* X vedi FOTO*)
    (* X SLIDE SOL -> NOTA: seconda riga ERRORE: no (0,x) MA (x,0) *)
    (* X vedi CHAT con CLAUDE *)

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 5.9 *)
(* fghfhgf *)



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