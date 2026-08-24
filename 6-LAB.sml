(* ESEMPIO delle SLIDE (lettura da testo): *)
(* Crea una lista di char con il testo contenuto nel file "helloworld" *)
val infile = TextIO.openIn("helloworld.txt");

fun makeList_aux (infile, NONE) = nil
    | makeList_aux (infile, SOME c) = c::makeList_aux(infile, TextIO.input1(infile));

fun makeList(infile) = makeList_aux(infile, TextIO.input1(infile));


makeList(infile); (* Chiamata della funzione *)

TextIO.closeIn(infile); (* chiude la lettura da stream *)

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)
(* ---------------------------------------------------------------------------- *)


(* Es. 6.1 *)
(* Lettura da file *)
val input = TextIO.openIn("filename.txt"); (* apro file *)

TextIO.inputN(input, 5); (* leggi i primi 5 caratteri *)
TextIO.inputLine(input); (* legge una riga di testo (non legge i primi 5 caratteri perchè il puntatore di lettura si è spostato) *)
TextIO.lookahead(input); (* legge il carattere dopo il puntatore di lettura "senza consumarlo" *)
TextIO.input(input); (* legge tutto il testo del file (dalla posizione attuale del puntatore fino alla fine) *)

TextIO.closeIn(input); (* chiude la lettura da stream *)

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.2 *)
(* Lettura da file di parole poi inserite senza spazi in una lista *)
(* -------------- LE MIE VERSIONI -------------- *)
val infile = TextIO.openIn("helloworld.txt"); (* apro file *)

fun getWord(infile, NONE) = nil
    | getWord(infile, SOME #" ") = nil
    | getWord(infile, SOME #"\n") = nil
    | getWord(infile, SOME c) = c::getWord(infile,TextIO.input1(infile));

(* getWord(infile,TextIO.input1(infile)); // Chiamata alla funzione, salva in una lista una singola parola. *)

(* VERSIONE con if...then...else... *)
fun getListIf(infile) = if TextIO.endOfStream(infile) then nil else implode(getWord(infile, TextIO.input1(infile)))::getListIf(infile);

(* VERSIONE con PATTERN MATCHING *)
fun getListAux(infile, NONE) = nil
    | getListAux(infile, SOME c) = implode(getWord(infile, SOME c))::getListAux(infile,TextIO.input1(infile));

fun getList(infile) = getListAux(infile, TextIO.input1(infile));

getListIf(infile); (* Chiamata della funzione *)
getList(infile); (* Chiamata della funzione *)

TextIO.closeIn(infile); (* chiude la lettura da stream *)

(* -------------- VERSIONE DELLA PROF -------------- *)
(* La versione della prof è più corretta della mia perchè gestisce anche il caso in cui ci siano due spazi dopo una parola. *)
(* test if a character is white space *)
fun white(" ") = true
    | white("\t") = true
    | white("\n") = true
    | white("\r") = true
    | white(_) = false;

(* read one word *)
fun getWordPROF(file) = if TextIO.endOfStream(file) then "" else
                        let
                            val c = TextIO.inputN(file,1)
                        in
                            if white(c) then "" else c^getWordPROF(file)
                        end;

(*test if a string is empty*)
fun is_empty("") = true
    | is_empty(_) = false;

(* read all words from an instream *)
fun getList1(file) = if TextIO.endOfStream(file) then nil else
                        let
                            val w = getWordPROF(file);
                            val tail = getList1(file)
                        in
                            if is_empty(w) then tail else w::tail
                        end;

(* read all words from a file given the file name *)
fun getListPROF(filename) = getList1(TextIO.openIn(filename)); (* Apertura dello stream dalla funzione, non globalmente *)

getListPROF("helloworld.txt"); (* Chiamata alla funzione *)

(* TextIO.closeIn(infile); // Chiude la lettura da stream -> NOTA: non per forza necessario *) 

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* ESEMPIO delle SLIDE (gestione delle eccezioni parametrizzate): *)
exception OutOfRange of int * int;

fun comb1(n, m) =
    if n < 0 orelse m < 0 orelse m > n then
        raise OutOfRange(n, m)
    else if m = 0 orelse m = n then 1
    else comb1(n-1, m) + comb1(n-1, m-1);

fun comb(n, m) =
    comb1(n, m)
    handle OutOfRange(0, 0) => 1
         | OutOfRange(n, m) =>
               (print("out of range: n=" ^ Int.toString(n) ^
                      " m=" ^ Int.toString(m) ^ "\n"); 0);

comb(3, 4);
comb(0, 0);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.3 *)
(* Restituisce il terzo elemento della lista altrimenti solleva eccezione *)
exception TooShort of int list;

fun len(l) = if l=[] then 0 else 1+len(tl(l));

fun returnThird1(L) = if len(L)<3 then raise TooShort(L) else hd(tl(tl(L)));

fun returnThird(L) = returnThird1(L) handle TooShort(L) => (print("List too short."); print ("\n"); 
                                                            print("It only contains "); print(Int.toString(len(L))); print(" elements."); print ("\n"); 0);

returnThird([1,2,3,4]);
returnThird([1,2]);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.4 *)
(* Fattoriale + messaggio di errore quando n è un numero negativo *)
exception Negative of int;

fun fattoriale1 (0) = 1
    | fattoriale1 (n) = if n<0 then raise Negative(n) else n*fattoriale1(n-1);

fun fattoriale(n) = fattoriale1(n) handle Negative(n) => (print("Negative arguments "); print(Int.toString(n)); print(" found."); print ("\n"); 0);

fattoriale(5);
fattoriale(0);
fattoriale(~2);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.5 *)
(* Fattoriale + messaggio di errore quando n è un numero negativo *)
exception Negative of int;

fun fattoriale1 (0) = 1
    | fattoriale1 (n) = if n<0 then raise Negative(n) else n*fattoriale1(n-1);

fun fattoriale(n) = fattoriale1(n) handle Negative(n) => (print("Negative arguments "); print(Int.toString(n)); print(" found."); print ("\n"); 0);

fattoriale(5);
fattoriale(0);
fattoriale(~2);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.6 *)
(* Stampa una colonna con i valori di x seguendo questa progressione ( 𝑥 = 𝑎,  𝑎 + 𝛿 , 𝑎 + 2𝛿, ... , 𝑎 + (𝑛 − 1)𝛿 ) e una colonna con i valori di x al quadrato *)
(* LA MIA VERSIONE: *)
fun tabulate1(a, inc, 0, F, i) = print ("")
    | tabulate1(a, inc, n, F, i) = 
        let
            val x = a + (real(i)*inc);
            val fx = F(x);
        in
            (print(Real.toString(x)); print(" "); print(Real.toString(fx)); print ("\n"); tabulate1(a, inc, n-1, F, i+1))
        end;

fun tabulate(a, inc, n, F) = tabulate1(a, inc, n, F, 0);

tabulate(1.0, 0.1, 9, fn x => x*x);
tabulate(1.0, 0.0, 9, fn x => x*x);
tabulate(1.0, 0.0, 0, fn x => x*x);
tabulate(1.0, 0.1, 0, fn x => x*x);

(* LA VERSIONE DELLA PROF: *)
fun tabulatePROF(x,delta,0,F) = ()
| tabulatePROF(x,delta,n,F) = (print(Real.toString(x)); print("\t"); print(Real.toString(F(x))); print("\n"); tabulatePROF(x+delta,delta,n-1,F));

tabulatePROF(1.0, 0.1, 9, fn x => x*x);
tabulatePROF(1.0, 0.0, 9, fn x => x*x);
tabulatePROF(1.0, 0.0, 0, fn x => x*x);
tabulatePROF(1.0, 0.1, 0, fn x => x*x);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.6 *)
(* Data una lista di real sostituisce ogni numero negativo della lista con il numero 0.0 *)
(* LA MIA VERSIONE: *)
fun simpleMap(F,nil) = nil
| simpleMap(F,x::xs) = F(x) :: simpleMap(F,xs);

fun zeroIfNeg x = if x < 0.0 then 0.0 else x;

simpleMap(zeroIfNeg, [0.0, 1.0, ~2.1, ~2.3]);
simpleMap(zeroIfNeg, nil);

(* LA VERSIONE DELLA PROF: *)
fun simpleMapPROF(F,nil) = nil
| simpleMapPROF(F,x::xs) = F(x) :: simpleMapPROF(F,xs);

val L1 = [0.0, 1.0, ~2.1, ~2.3];
val L2 = nil;

simpleMapPROF(fn x => if x<0.0 then 0.0 else x, L1);
simpleMapPROF(fn x => if x<0.0 then 0.0 else x, L2);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.7 *)
(* Data una lista di real sostituisce ogni numero negativo della lista con il numero 0.0 *)
exception EmptyList;

fun reduce(F,nil) = raise EmptyList
    | reduce(F,[a]) = a
    | reduce(F,x::xs) = F(x, reduce(F,xs));

val L = [1.1, 2.2, 4.4, 3.3];

reduce(fn (x,y) => if x>y then x else y, L);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.8 *)
(* Data una lista di numeri real restituisce una lista con solo i numeri maggiori di 0 *)
fun filter(P,nil) = nil
    | filter(P,x::xs) = if P(x) then x::filter(P,xs) else filter(P,xs);

val L1 = [1.1, ~1.2, ~1.3, 1.4];
val L2 = nil;

(* LA MIA VERSIONE: *)
filter(fn x => if x>0.0 then true else false, L1);
filter(fn x => if x>0.0 then true else false, L2);

(* LA VERSIONE DELLA PROF: *)
filter(fn (x) => x>0.0, L1);
filter(fn (x) => x>0.0, L2);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.9 *)
(* Dato un file di testo contenente una lista di numeri in colonna restituire la somma di questi numeri *)
(* LA MIA VERSIONE (complessa ma funziona): *)
fun getNumber(infile, NONE) = nil
    | getNumber(infile, SOME #" ") = nil
    | getNumber(infile, SOME #"\n") = nil
    | getNumber(infile, SOME c) = c::getNumber(infile,TextIO.input1(infile));

fun getList(infile) = if TextIO.endOfStream(infile) then nil else implode(getNumber(infile,TextIO.input1(infile)))::getList(infile);

fun readAndSumAux(nil) = 0
    | readAndSumAux(x::xs) = valOf(Int.fromString(x))+readAndSumAux(xs);

fun readAndSum1(infile) = readAndSumAux(getList(infile));

fun readAndSum(infile) = readAndSum1(TextIO.openIn(infile));

readAndSum("numbers.txt"); (* Chiamata alla funzione *)

(* LA VERSIONE DELLA PROF: *)

fun readAndSum1PROF(file) = if TextIO.endOfStream(file) then 0 else valOf(Int.fromString(valOf(TextIO.inputLine(file)))) + readAndSum1PROF(file);

fun readAndSumPROF(filename) = readAndSum1PROF(TextIO.openIn(filename));

readAndSumPROF("numbers.txt"); (* Chiamata alla funzione *)

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.10 *)
(* Dato un file di testo contenente una lista di numeri in colonna restituire la somma di questi numeri *)
fun applyList nil _ = nil
    | applyList (F::Fs) a = F(a)::(applyList Fs a);

applyList [fn x=>x*2, fn x => x*x*x] 4;

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)