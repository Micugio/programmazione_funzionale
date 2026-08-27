fun rev(nil) = nil
    | rev(x::xs) = rev(xs)@[x];

fun prefix1(nil) = nil
    | prefix1(L as x::xs) = implode(rev(L))::prefix1(xs);

fun prefix(stringa) = prefix1(rev(explode(stringa)));

prefixes("ciao");
prefixes("");
prefixes("hi world");