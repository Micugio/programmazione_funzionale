(* 
---------------------- Esame pratico dell'appello di luglio 2025 (15/07/2025) ----------------------

Dato il tipo di dato (un albero di numeri interi):

```sml
datatype Tree = Leaf of int |  Node of int * Tree * Tree | Empty
```

Scrivere due funzioni, la prima: ```all_paths (Tree -> int list list)``` deve restituire tutti i percorsi 
dalla radice dell'albero alle foglie (```Empty``` non è considerato una foglia).
La seconda funzione, ```filter_paths ('a list * ('a -> bool) -> 'a list)``` prende in input una lista di 
path (lista di liste, vedasi output di ```all_paths```) e una generica funzione ```(int list -> bool)```,
la funzione restituisce una lista di liste contenente tutti i path dove, applicata la funzione data in input, 
soddisfano tale condizione (```true```).

È ammesso l'utilizzo della funzione ```map``` ma **NON** di altre funzioni di libreria._


----- Output previsto (Poly/ML 5.7.1 Release) -----

datatype Tree = Empty | Leaf of int | Node of int * Tree * Tree
val all_paths = fn: Tree -> int list list
val filter_paths = fn: 'a list * ('a -> bool) -> 'a list

val tree =
   Node
    (1, Empty,
     Node
      (2, Node (3, Leaf 5, Node (6, Node (8, ..., ...), Leaf 9)),
       Node (4, Empty, Node (7, Leaf 10, Empty)))): Tree

val sum_lower_than_30 = fn: int list -> bool
val paths = [[1, 2, 3, 5], [1, 2, 3, 6, 8, 10], [1, 2, 3, 6, 9], [1, 2, 4, 7, 10]]: int list list
val it = [[1, 2, 3, 5], [1, 2, 3, 6, 9], [1, 2, 4, 7, 10]]: int list list
*)

datatype Tree = Leaf of int |  Node of int * Tree * Tree | Empty;

val tree =
   Node
    (1, Empty,
     Node
      (2, Node (3, Leaf 5, Node (6, Node (8, Leaf 10, Empty), Leaf 9)),
       Node (4, Empty, Node (7, Leaf 10, Empty))));

(*
                 1
          /             \
         /               \
        /                 \
     Empty                 2
                    /             \
                   /               \
                  3                 4
               /     \           /     \
              /       \         /       \
        Leaf(5)        6     Empty       7
                     /   \             /   \
                    /     \           /     \
                   8    Leaf(9)   Leaf(10) Empty
                 /   \
                /     \
          Leaf(10)  Empty                               *)

fun sumList(nil) = 0
    | sumList(x::xs) = x+sumList(xs);

sumList([1,2,3]);

fun sum_lower_than_30(L) = if sumList(L)<30 then true else false;

sum_lower_than_30([1,2,3]);

(*
fun all_paths(Leaf(v)) = [v]
    | all_paths(Node (v, left, right)) = 
        let
            val sx = all_paths(left);
            val dx = all_paths(right);
        in
            if v::all_paths(left)@all_paths(right);
        end;


v::all_paths(left)@all_paths(right);

fun all_paths(Leaf(v)) = [v]
    | all_paths(Node (v, left, right)) = if left <> Empty then v::all_paths(left) else if right <> Empty then v::all_paths(right) else nil;

fun all_paths(Leaf(v)) = [[v]]
    | all_paths(Node (v, Empty, right)) = if right<>Empty then [v]::all_paths(right) else [nil]
    | all_paths(Node (v, left, Empty)) = if left <> Empty then [v]::all_paths(left) else [nil]
    | all_paths(Node (v, left, right)) = [v]::all_paths(left)@all_paths(right);
*)  

fun all_paths(Leaf(v)) = [[v]]
    | all_paths(Empty) = []
    | all_paths(Node (v, left, right)) = map (fn path => v :: path) (all_paths(left) @ all_paths(right));

all_paths(tree);

(*
fun filter_paths ('a list * ('a -> bool) -> 'a list)
FINIREEEEE
*)