(*
    ESERCIZIO ESAME 1
    Testo:
    Write a function prefixes (having type string -> string list) that given a string, returns a list of strings
    including all the prefixes of the input string (including the string itself and except for the empty string).
*)

fun remove_last [] = []
    | remove_last (h::[]) = []
    | remove_last (h::t) = h :: (remove_last t);

fun aux_pref [] = []
    | aux_pref l = aux_pref (remove_last l) @ [(implode l)];

fun prefixes s = aux_pref (explode s);

(* ESEMPIO ESECUZIONE: *)

prefixes "ciao"; (* val it = ["c", "ci", "cia", "ciao"]: string list *)
prefixes ""; (* val it = []: string list *)
prefixes "hi world"; (* val it = ["h", "hi", "hi ", "hi w", "hi wo", "hi wor", "hi worl", "hi world"]: string list *);
