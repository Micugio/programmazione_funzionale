(* Esercizio ML simulazione 28-05-2026 *)

datatype Natural = Zero | Integer of int

datatype tree = Empty | Leaf of Natural | Node of Natural * tree * tree

(*
fun filter_tree (Empty,f) = Empty
    | filter_tree (Leaf Zero,f) = Leaf Zero
    | filter_tree (Leaf Integer,f) = Leaf Zero
    | filter_tree (Node t,f)
*)
fun filter_tree (Empty,f) = Empty
    | filter_tree (Leaf t,f) = if (t<>Zero) andalso f(t) then Zero else Integer
    | filter_tree (Node (T as (a,b,c)),f) = ((if (a<>Zero) andalso f(a) then Zero else Integer), filter_tree (b), filter_tree (c));


fun even (n) = (n mod 2) = 0;
fun odd (n) = (n mod 2) <> 0;

val test_tree = Node(Integer 1, Node(Zero, Leaf(Integer 2), Leaf (Integer 5)), Leaf (Integer 4));

filter_tree(test_tree, odd);
filter_tree(test_tree, even);