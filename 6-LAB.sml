(* ESEMPIO delle SLIDE: *)
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
(*  *)
val infile = TextIO.openIn("helloworld"); (* apro file *)

fun getWord(infile, NONE) = nil
    | getWord(infile, SOME #" ") = nil
    | getWord(infile, SOME #"\n") = nil
    | getWord(infile, SOME c) = c::getWord(infile,TextIO.input1(infile));

(* TEST: 
getWord(infile,TextIO.input1(infile));
*)

fun getList(infile) = if TextIO.endOfStream(infile) then nil else implode(getWord(infile, TextIO.input1(infile)))::getList(infile);


getList(infile); (* Chiamata della funzione *)

TextIO.closeIn(infile); (* chiude la lettura da stream *)

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.3*)
(*  *)


val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.4*)
(* Fattoriale + messaggio di errore quando n è un numero negativo *)
exception Negative of int;

fun fact1 0 = 1
    | fact1 n = if n<0 then n*fact1(n-1)
                else raise Negative(n);

fun fact n = fact1(n) handle Negative(n) => (
        print("Negative argument"); 
        print(Int.toString(n)); 
        print("found.In");
        0
    );

fact (5);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)