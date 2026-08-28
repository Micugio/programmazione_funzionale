datatype Ptree = Empty | PLeaf of int*string | PNode of int* string * Ptree * Ptree;

val tree = PNode(2,"good",PNode(3,"good",PLeaf(6,"bad"),PLeaf(7,"bad")),PNode(5,"bad",PLeaf(1,"good"),Empty)); 

(* Conta i numeri pari dell'albero *)
fun count_even (Empty) = 0
    | count_even (PLeaf(n, s)) = if n mod 2 = 0 then 1 else 0
    | count_even (PNode(n, s, left, right)) = if n mod 2 = 0 then 1 + count_even(left) + count_even(right) else count_even(left) + count_even(right);


count_even(tree);  (* = 2 *)
