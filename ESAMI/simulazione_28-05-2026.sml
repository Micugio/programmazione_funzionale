(* Esercizio ML simulazione 28-05-2026 *)

(* LA MIA SOLUZIONE *)
datatype Natural = Zero | Integer of int;

datatype tree = Empty | Leaf of Natural | Node of Natural * tree * tree;

val test_tree = Node(Integer 1, Node(Zero, Leaf(Integer 2), Leaf (Integer 5)), Leaf (Integer 4));

fun filter_tree (Empty, F) = Empty
    | filter_tree (Leaf(Zero), F) = Leaf(Zero)
    | filter_tree (Leaf(Integer(v)), F) = if F(v) then Leaf(Integer(v)) else Leaf(Zero)
    | filter_tree (Node(Zero, left, right), F) = Node(Zero, filter_tree(left,F), filter_tree(right,F))
    | filter_tree (Node(Integer(v), left, right), F) = if F(v) then Node(Integer(v), filter_tree(left,F), filter_tree(right,F)) else Node(Zero, filter_tree(left,F), filter_tree(right,F));

fun odd n = n mod 2 <> 0; (* DISPARI *)

fun even n = n mod 2 = 0; (* PARI *)

filter_tree (test_tree, odd);
filter_tree (test_tree, even);
