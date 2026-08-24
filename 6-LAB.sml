(* ESEMPIO delle SLIDE (lettura da testo): *)
(* Crea una lista di char con il testo contenuto nel file "helloworld" *)
val infile = TextIO.openIn("helloworld");

fun makeList_aux (infile, NONE) = nil
    | makeList_aux (infile, SOME c) = c::makeList_aux(infile, TextIO.input1(infile));

fun makeList(infile) = makeList_aux(infile, TextIO.input1(infile));


makeList(infile); (* Chiamata della funzione *)

TextIO.closeIn(infile); (* chiude la lettura da stream *)

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)
(* ---------------------------------------------------------------------------- *)


(* Es. 6.1*)
(* Lettura da file *)
val input = TextIO.openIn("filename"); (* apro file *)

TextIO.inputN(input, 5); (* leggi i primi 5 caratteri *)
TextIO.inputLine(input); (* legge una riga di testo (non legge i primi 5 caratteri perchè il puntatore di lettura si è spostato) *)
TextIO.lookahead(input); (* legge il carattere dopo il puntatore di lettura "senza consumarlo" *)
TextIO.input(input); (* legge tutto il testo del file (dalla posizione attuale del puntatore fino alla fine) *)

TextIO.closeIn(input); (* chiude la lettura da stream *)

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.2*)
(* Lettura da file di parole poi inserite senza spazi in una lista *)
(* -------------- LE MIE VERSIONI -------------- *)
val infile = TextIO.openIn("helloworld"); (* apro file *)

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
fun is_empty("")=true
    | is_empty(_)=false;

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

getListPROF("helloworld"); (* Chiamata alla funzione *)

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

(* Es. 6.3*)
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

(* Es. 6.4*)
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

(* Es. 6.5*)
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