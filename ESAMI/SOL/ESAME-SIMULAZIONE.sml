(* Esercizio ML simulazione 28-05-2026 *)

(* LA SOLUZIONE DELLA PROF *)
datatype Natural = Zero | Integer of int;

datatype tree = Empty | Leaf of Natural | Node of Natural * tree * tree;

val test_tree = Node(Integer 1, Node(Zero, Leaf(Integer 2), Leaf (Integer 5)), Leaf (Integer 4));

fun filter_tree (Empty, _) = Empty
    | filter_tree (Leaf Zero, _) = Leaf Zero
    | filter_tree (Leaf (Integer n), f) = if f n then Leaf(Integer n) else Leaf(Zero)
    | filter_tree (Node(v, l, r), f) =
        let
            val fil_left = filter_tree (l, f)
            val fil_right = filter_tree (r, f)
        in
            case v of 
                Integer v => (if f v then Node(Integer v, fil_left, fil_right) else Node(Zero, fil_left, fil_right))
                | Zero => Node(Zero, fil_left, fil_right)
        end;

fun odd n = n mod 2 <> 0; (* DISPARI *)

fun even n = n mod 2 = 0; (* PARI *)

filter_tree (test_tree, odd);
filter_tree (test_tree, even);
