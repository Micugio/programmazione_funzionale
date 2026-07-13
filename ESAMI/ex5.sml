(*
    ESERCIZIO ESAME 5
    Testo:
    Given the following datatype that defines the structure a binary tree
*)
datatype Ptree = Empty | PLeaf of int*string | PNode of int* string * Ptree * Ptree
(*
    Write a function count_even (Ptree -> int) that, given a Ptree,
    returns how many even integers appear as first argument of the pair in the Ptree.
*)

fun isPair n = if (n mod 2) = 0 then true else false;

fun count_even (Empty) = 0
    | count_even (PLeaf(n,s)) = if isPair n then 1 else 0
    | count_even (PNode(n,s,l,r)) = if isPair n then 1 + count_even(l) + count_even (r) else count_even(l) + count_even(r);

(* ESEMPIO ESECUZIONE: *)

count_even(PNode(2,"good",PNode(3,"good",PLeaf(6,"bad"),PLeaf(7,"bad")),PNode(5,"bad",PLeaf(1,"good"),Empty))); (* = 2 *)
