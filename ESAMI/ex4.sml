datatype ctree = Empty | Leaf of char | Node of char * ctree * ctree;

val tree = Node (#"a", Leaf #"c", Node (#"b", Leaf #"e", Leaf #"i"));

(*
fun get_wordsLeaf(Empty, L) = nil
    | get_wordsLeaf(Leaf(v), L) = L@[v]
    | get_wordsLeaf(Node(v, left, right), L) = get_wordsLeaf(left, L) @ get_wordsLeaf(right, L);

fun get_wordsNode(Empty, L) = nil
    | get_wordsNode(Leaf(v), L) = nil
    | get_wordsNode(Node(v, left, right), L) = L@[v] @ get_wordsNode(left, L) @ get_wordsNode(right, L);

fun get_words(tree) = (implode(get_wordsLeaf(tree, nil)), implode(get_wordsNode(tree, nil)));

NOTA: usare il parametro L non serve a niente, rimane sempre nil, la parte di unione è fatta dalle chiamate ricorsive e dall'operatore @. Tuttavia se usi anche L non è sbagliato!
*)

fun get_wordsLeaf(Empty) = nil
    | get_wordsLeaf(Leaf(v)) = [v]
    | get_wordsLeaf(Node(v, left, right)) = get_wordsLeaf(left) @ get_wordsLeaf(right);

fun get_wordsNode(Empty) = nil
    | get_wordsNode(Leaf(v)) = nil
    | get_wordsNode(Node(v, left, right)) = [v] @ get_wordsNode(left) @ get_wordsNode(right);

fun get_words(tree) = (implode(get_wordsLeaf(tree)), implode(get_wordsNode(tree)));


get_words(tree);   (* = (“cei”,”ab”) *)