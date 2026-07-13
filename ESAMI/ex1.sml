(*
    ESERCIZIO ESAME 1
    Testo:
    Write a function suffixes (having type string -> string list) that given a string,returns a list of strings
    including all the suffixes of the input string (including the string itself and except for the empty string).

    SOLUZIONE:
*)

fun suffixes s = let
        fun aux_suffixes [] = []
            | aux_suffixes (l as (h::t)) = (implode l)::(aux_suffixes t);
    in
        aux_suffixes (explode s)
    end;

(* ESEMPIO ESECUZIONE: *)

suffixes "ciao"; (* = ["ciao","iao","ao","o"], *)
suffixes ""; (* = [], *)
suffixes "hi world"; (* = ["hi world","i world","world","world","orld","rld","ld","d"]. *)
