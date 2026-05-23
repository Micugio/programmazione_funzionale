(* Es. 6.1*)
(* Lettura da file *)
val input = TextIO.openIn("filename");

TextIO.inputN(input, 5); (* leggi i primi 5 caratteri *)
TextIO.inputLine(input); (* legge una riga di testo (non legge i primi 5 caratteri perchè il puntatore di lettura si è spostato) *)
TextIO.lookahead(input); (* legge il carattere dopo il puntatore di lettura "senza consumarlo" *)
TextIO.input(input); (* legge tutto il testo del file *)
TextIO.closeIn(input); (* chiude la lettura da stream *)

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 6.2*)

(* ESEMPIO NO SOLUZIONE: *)
val infile = TextIO.openIn("helloworld");

fun makeList1 (infile, NONE) = nil
    | makeList1 (infile, SOME c) = c::makeList1(infile, TextIO.input1(infile));

fun makeList(infile) = makeList1(infile, TextIO.input1(infile));

TextIO.closeIn(infile); (* chiude la lettura da stream *)

makeList (infile);

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

fact (-5);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)