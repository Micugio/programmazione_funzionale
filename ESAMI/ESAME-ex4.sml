datatype ctree = Empty | Leaf of char | Node of char * ctree * ctree

fun get_words(Empty) = ([],[])
    | get_words(Leaf t) = (str(t))
    | get_words(Node())


get_words(Node (#"a", Leaf #"c", Node (#"b", Leaf #"e", Leaf #"i")));