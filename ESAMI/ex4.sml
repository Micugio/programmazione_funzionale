(*
    ESERCIZIO ESAME 4
    Testo:
    Given the following datatype that defines the structure of a binary tree
*)
datatype ctree = Empty | Leaf of char | Node of char * ctree * ctree;
(*
    Write a function get_words (ctree -> string*string) that, given a ctree, returns a pair of strings,
    such that the first string is the concatenation of the characters in the leaves
    and the second string is the concatenation of the characters in the nodes
*)

fun get_words ct =
    let
        fun get_leaf_word (Empty) = ""
            | get_leaf_word (Leaf(c)) = str c
            | get_leaf_word (Node(c,l,r)) = (get_leaf_word l) ^ (get_leaf_word r);

        fun get_node_word (Empty) = ""
            | get_node_word (Leaf(c)) = ""
            | get_node_word (Node(c,l,r)) = (str c) ^ (get_node_word l) ^ (get_node_word r);
    in
        (get_leaf_word ct, get_node_word ct)
    end;

(* ESEMPIO ESECUZIONE: *)

get_words(Node (#"a", Leaf #"c", Node (#"b", Leaf #"e", Leaf #"i"))); (* = (“cei”,”ab”) *)
