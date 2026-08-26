(* Es. 7.1 *)
(* Funzione curried per moltiplicare 3 numeri *)
fun curry F x1 x2 x3 = F(x1,x2,x3);

curry (fn (x,y,z)=>x*y*z) 1 2 3;

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 7.2 *)
(* Uso funzione predefinita map per trasformare una lista di int in real *)
fun toReal L = map real L;

toReal ([1,2,3]);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 7.3 *)
(* Calcolare a due a due il risultato di una lista di valori booleani *)
fun andb(L) = foldl (fn (x, acc) => x andalso acc) true L; (* NOTA: come accomulatore iniziale uso true perchè è l'elemento neutro dei valori booleani quindi non influenza il calcolo *)

andb([true,false,true]);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 7.4 *)
(* Definisci la funzione predefinita implode usando map, foldr o foldl *)
fun implode(L) = foldr (fn (x, acc) => (str(x))^(acc)) "" L; (* NOTA: come accomulatore iniziale uso "" perchè è l'elemento neutro delle stringhe *)

implode([#"b",#"c"]);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)
(* ---------------------------------------------------------------------------- *)

(* ESEMPIO delle SLIDE (costruzione e print di un albero binario): *)
datatype 'label btree = Empty | Node of 'label * 'label btree * 'label btree;

val t = Node("Ciao",
            Node("a",
                Node("tutto", Empty, Empty),
                Node("il", Empty, Empty)),
            Node("mondo!", Empty, Empty));

(*
       "Ciao"
      /    \
   "a"    "mondo!"
   /  \
 "tutto"  "il"           *)

fun printTreePreOrd(Empty) = ()
    | printTreePreOrd(Node(a, left, right)) = (print(a); print(" ");
                                               printTreePreOrd(left);
                                               printTreePreOrd(right));

fun printTreePostOrd(Empty) = ()
    | printTreePostOrd(Node(a, left, right)) = (printTreePostOrd(left);
                                                printTreePostOrd(right);
                                                print(a); print(" "));

printTreePreOrd(t);
printTreePostOrd(t);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)
(* ---------------------------------------------------------------------------- *)

(* Es. 7.5 *)
(* Restituire i nodi di un albero in una lista *)
datatype 'a btree = Empty | Node of 'a * 'a btree * 'a btree;

val t = Node("ML",
            Node("as",
                Node("a", Empty, Empty),
                Node("in", Empty, Empty)),
            Node("types", Empty, Empty));

(*
       "ML"
      /    \
   "as"    "types"
   /  \
 "a"  "in"             *)

(* LA MIA VERSIONE: *)
fun postOrder1(Empty, L) = L
    | postOrder1(Node(a, left, right), L) = postOrder1(left, postOrder1(right, a::L));

fun postOrder(t) = postOrder1(t, nil);

postOrder(t);

val _ = print ("\n");

(* LA VERSIONE DELLA PROF: *)
fun postOrderPROF(Empty) = nil
    | postOrderPROF(Node(a,left,right)) = postOrder(left) @ postOrder(right) @ [a];

postOrderPROF(t);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 7.6 *)
(* Restituire i nodi di un albero in una lista *)
datatype 'a btree = Empty | Node of 'a * 'a btree * 'a btree;

val t = Node("ML",
            Node("as",
                Node("a", Empty, Empty),
                Node("in", Empty, Empty)),
            Node("types", Empty, Empty));

(*
       "ML"
      /    \
   "as"    "types"
   /  \
 "a"  "in"             *)

fun inOrder(Empty) = nil
    | inOrder(Node(a, left, right)) = inOrder(left) @ [a] @ inOrder(right);

inOrder(t);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 7.7 *)
(* Definire il nuovo type mapTree *)
type ('d,'r) mapTree = ('d * 'r) btree;

val t1 = Node(("a",1), Empty, Empty) : (string, int) mapTree;

(*
        ("a", 1)
        /      \
     Empty   Empty      *)

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 7.8 *)
(* Somma tutti i valori int di un albero di tipo mapTree *)
type ('d,'r) mapTree = ('d * 'r) btree;

val t1 = Node(("a",1), Empty, Empty) : (string, int) mapTree;

(*
        ("a", 1)
        /      \
     Empty   Empty      *)

val t2 = (Node(("a",1), Node(("c",2), Empty, Node(("d",3), Empty, Empty)), Empty)) : (string, int) mapTree;

(*
        ("a", 1)
        /      \
   ("c", 2)   Empty
    /    \
 Empty  ("d", 3)
        /      \
     Empty    Empty       *)

fun sumTree(Empty) = 0
    | sumTree(Node((a,b), left, right)) = b + sumTree(left) + sumTree(right);

sumTree(t1);
sumTree(t2);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 7.9 *)
(* Conta il numero di nodi che soddisfano entrambe queste 2 condizioni: - non sono foglie (cioè i nodi che hanno almeno un sotto-albero non Empty)
                                                                        - soddisfano il predicato (cioè il loro valore è maggiore di 5)            *)
datatype 'a btree = Empty | Node of 'a * 'a btree * 'a btree;

val t1 = Node(10, Node(8, Empty, Empty), Empty);
val t2 = Node(22, Empty, Empty);
val t3 = Empty;

val t4 = Node(10,
                Node(8, Empty, Empty),
                Node(12,
                    Node(2, Empty, Empty),
                    Empty));

(*
              10
           /      \
          8        12
        /   \     /   \
    Empty Empty  2   Empty
                / \
            Empty Empty         *)

(* LA MIA VERSIONE: *)
fun countInternalNodes(F)(Empty) = 0
    | countInternalNodes(F)(Node(v, Empty, Empty)) = 0
    | countInternalNodes(F)(Node(v, left, right)) = if F(v) then 1 + countInternalNodes(F)(left) + countInternalNodes(F)(right) else 0 + countInternalNodes(F)(left) + countInternalNodes(F)(right);

countInternalNodes(fn x => x>5)(t1);
countInternalNodes(fn x => x>5)(t2);
countInternalNodes(fn x => x>5)(t3);
countInternalNodes(fn x => x>5)(t4);

val _ = print ("\n");

(* LA VERSIONE DELLA PROF: *)
fun countInternalNodesPROF p Empty = 0
    | countInternalNodesPROF p (Node(x, Empty, Empty)) = 0
    | countInternalNodesPROF p (Node(x, left, right)) =
        let
            val current = if p x then 1 else 0
        in
            current + countInternalNodesPROF p left + countInternalNodesPROF p right
        end;

countInternalNodesPROF (fn x => x>5) t1;
countInternalNodesPROF (fn x => x>5) t2;
countInternalNodesPROF (fn x => x>5) t3;
countInternalNodesPROF (fn x => x>5) t4;

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 7.10 *)
(*  *)
datatype 'a bltree = Empty | Leaf of 'a | Node of 'a * 'a bltree * 'a bltree;

val Tree = Node(10, Leaf(5), Node(3, Empty, Leaf(1)));

(*
          10
       /      \
   Leaf(5)     3
             /   \
         Empty  Leaf(1)         *)

fun doubleTree(Empty) = Empty
    | doubleTree(Leaf(v)) = Leaf(v*2)
    | doubleTree(Node(v, left, right)) = Node(v*2, doubleTree(left), doubleTree(right));

doubleTree(Tree);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)