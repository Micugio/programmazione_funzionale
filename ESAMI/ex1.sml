fun suffixes1(nil) = nil
    | suffixes1(L as x::xs) = implode(L)::suffixes1(xs);

fun suffixes(stringa) = suffixes1(explode(stringa));


suffixes("ciao");
suffixes("");
suffixes("hi world");