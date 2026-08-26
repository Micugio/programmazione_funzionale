datatype Ptree = Empty | PLeaf of int*string | PNode of int* string * Ptree * Ptree

fun count_even(Empty) = 0
    | count_even(PLeaf (T as (a,b))) = if (a mod 2)=0 then 1 else 0
    | count_even(PNode (T as (a,b,c,d))) = (if (a mod 2)=0 then 1 else 0) + count_even(c) + count_even(d);


count_even(PNode(2,"good",PNode(3,"good",PLeaf(6,"bad"),PLeaf(7,"bad")),PNode(5,"bad",PLeaf(1,"good"),Empty)));