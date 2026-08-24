(* ------------------------------- ESERCIZI LABORATORIO 2 ------------------------------- *)

fun cube (x:real) = x*x*x;

cube(2.9);



fun min3 (a, b, c) = if a<b then 
                        if a<c then 
                        a 
                        else
                        c
                     else if b<c then
                        b
                        else
                        c;

min3(2,3,4);
min3(3,2,4);
min3(3,4,2);



fun third (list) = hd(tl(tl(list)));

third([2,3,4]);
third([2,3,4,5]);



fun reverse(a,b,c) = (c,b,a);

reverse(1,2,3);



fun thirdchar (string) = str(third(explode(string)));

thirdchar("abcd");



fun cycle (list) = tl(list) @ [hd(list)];

cycle([1,2,3,4]);



fun max3 (a, b, c) = if a>b then 
                        if a>c then 
                        a 
                        else
                        c
                     else if b>c then
                        b
                        else
                        c;
fun min_max_pair (a,b,c) = (min3(a,b,c), max3(a,b,c));

min_max_pair(1,2,3);
min_max_pair(3,4,2);



fun middle3 (a, b, c) =  if a>b then 
                            if a<c then 
                                a 
                            else 
                                if b>c then
                                    b 
                                else
                                    c
                        else if a>c then
                                a
                             else 
                                if b<c then
                                    b 
                                else
                                    c;
middle3(1,2,3);
middle3(1,3,2);
middle3(3,2,1);
middle3(3,1,2);
middle3(2,1,3);
middle3(2,3,1);

fun sort (a,b,c) = [min3(a,b,c), middle3(a,b,c), max3(a,b,c)];

sort(1,2,3);
sort(1,3,2);



fun rnd (x:real) = (real(round(x*10.0)))/10.0;

rnd(2.56);
rnd(5.678);
rnd(3.3);
rnd(4.128);



fun rem (list) = [hd(list)] @ tl(tl(list));

rem ([1,2,3,4]);
rem ([1,2]);

(* ------------------------------- ESERCIZI LABORATORIO 3 ------------------------------- *)

fun reverse (L) = if L = nil then nil
                  else (reverse (tl L)) @ [hd L];

reverse([1,2,3]);



fun fact (n) = if n=1 then 1 else n*fact(n-1);

fact(1);
fact(10);



fun cyclei (i, l) = if i = 0 then l
                    else cyclei(i-1, tl(l)@[hd(l)]);

cyclei(2,[1,2,3,4]);



fun duplicate(l) = if l=[] then [] else [hd(l),hd(l)]@duplicate(tl(l));

duplicate([1,2,3,4]);



fun len(l) = if l=[] then 0 else 1+len(tl(l));

len([1,2,3,4]);



fun pow (x, i) = if i = 0 then 1.0 else x*pow(x,i-1);

pow(2.1,3);



fun maxList (L:string list) = if tl(L)=nil then hd(L)
                              else if hd(L) > hd(tl(L)) then maxList([hd(L)]@tl(tl(L)))
                                   else maxList(tl(L));

maxList (["a","abc","ab","a"]);



fun fact (1) = 1
    | fact (n) = n*fact(n-1);

fact(1);
fact(10);



fun cycle1 (nil) = nil
    | cycle1 (x::xs) = xs@[x];

cycle1([1]);
cycle1([1,2,3,4]);



fun cycleip (0, l) = l
    | cycleip (n, []) = []
    | cycleip (n, x::xs) = cycleip(n-1, xs@[x]);

cycleip(2,[1,2,3,4]);



fun duplicatep (nil) = nil
    | duplicatep (x::xs) = [x,x] @ duplicatep(xs);

duplicatep([1,2,3,4]);



fun power (x, 0) = 1.0
    | power (x, i) = x*power(x, i-1);

power(2.1,3);



(* VERSIONE per lista di real *)
fun maxListPr (nil) = nil
    | maxListPr ((x::nil):real list) = [x]
    | maxListPr (x::xs) = if x > hd(xs) then maxListPr(x::tl(xs)) else maxListPr(xs);

maxListPr ([2.0]);
maxListPr ([2.0,5.1,4.2]);
maxListPr ([2.0,5.1,4.2,2.5]);

(* ------------------------------- ESERCIZI LABORATORIO 4 ------------------------------- *)

fun flip (nil) = nil
    | flip (x::nil) = [x]
    | flip (x::y::zs) = y::x::flip(zs); 

flip ([1,2,3,4,5]);
flip ([1,2,3,4]);



fun remove (nil, _) = nil
    | remove (x::xs, 1) = xs
    | remove (x::xs, n) = x::remove(xs,n-1);

remove ([1],1);
remove ([1,2,3],3);
remove ([1,2],3);



fun flip (nil) = nil
    | flip (x as (a,b)::xs) = if a<b then (a,b)::flip(xs) else (b,a)::flip(xs);

flip([(1,2),(4,3)]);
flip[(5,2),(4,3),(6,5),(1,2)];
flip([(1,1),(1,2)]);
flip(nil);



fun vowel (nil) = false
    | vowel (x::xs) = if ((x = #"a") orelse
                          (x = #"e") orelse
                          (x = #"i") orelse
                          (x = #"o") orelse
                          (x = #"u")) then true else false;

vowel([#"a",#"b"]);
vowel([#"b",#"c"]);
vowel([#"a"]);
vowel([#"i",#"b"]);
vowel(nil);



fun member (n,nil) = false
    | member (n,x::xs) = if n=x then true else member(n,xs);

member(1,[2,3]);
member(2,[2,3,1]);
member(5,nil);
member("b",["aa","c"]);



fun delete(n,nil) = nil
    | delete (n,x::xs) = if n=x then xs else x::delete(n,xs);

delete(1,[2,3,4]);
delete(1,[2,1,3]);
delete(1,nil);
delete(#"b",[#"c",#"b",#"a"]);



fun insert(n,nil) = [n]
    | insert(n,x::xs) = if n=x then x::xs else x::insert(n,xs);

insert(2,[3,4,5]);
insert(3,[3,4,5]);
insert(2,nil);
insert(#"a",[#"b",#"c"]);



fun insertAll(n,nil) = nil
    | insertAll(n,x as S::xs) = (n::S)::insertAll(n,xs);  (* NOTA: se invece scrivo [n::S] ERRORE di TIPO, creo un'altra lista intorno alla lista. *)

insertAll(1,[[2,3],[],[3]]);
insertAll(1,nil);
insertAll(#"c",[[#"a",#"t"],[#"a",#"r"],nil]);

(* ------------------------------- ESERCIZI LABORATORIO 5 ------------------------------- *)

(* NOTA: questa versione funziona ma non risponde al quesito dell'esercizio *)
fun insertAll_aux (n,nil) = nil
    | insertAll_aux (n,x::xs) = (n::x)::insertAll_aux(n,xs); 

fun powerSet(nil) = [nil]
    | powerSet(x::xs) = let
                            val a = powerSet(xs);
                            val b = insertAll_aux(x,powerSet(xs));
                        in
                            a@b
                        end;

powerSet([6,7]);
powerSet([1,2,3]);
powerSet([#"a",#"c"]);
powerSet(nil); (* DA CONSEGNA: Non serve correggere errore di tipo *)



fun sumPairs(nil) = (0,0)
    | sumPairs((a,b)::xs) =   (* NOTA: volendo, anche se la sintassi non è corretta, la condizione si può scrivere così: "x as (a,b)::xs" *)
        let
            val M = a + #1(sumPairs(xs));
            val N = b + #2(sumPairs(xs));
        in
            (M,N)
        end;

sumPairs([(1,2),(3,4),(5,6)]);
sumPairs([]);



fun maxList (nil) = 0.0
    | maxList([x:real]) = x
    | maxList(x::xs) =
        let
            val maxTail = maxList(xs)
        in
            if x > maxTail then x else maxTail
        end;

maxList([2.0]);
maxList([2.0,5.1,4.2]);
maxList([2.0,5.1,4.2,2.5]);
maxList([]);



fun maxList (nil) = 0.0
    | maxList([x:real]) = x
    | maxList(x::xs) =
        let
            val maxTail = maxList(xs)
        in
            if x > maxTail then x else maxTail
        end;

maxList([2.0]);
maxList([2.0,5.1,4.2]);
maxList([2.0,5.1,4.2,2.5]);
maxList([]);



(* VERSIONE di Giovanni -> NOTA: non risponde alla consegna dell'esercizio *)
fun esponenziale(0) = 1
    | esponenziale(i) = 2*esponenziale(i-1);

fun potenza(x:real,0) = 1.0
    | potenza(x,i) = x*potenza(x,i-1);

fun doubleExp(x:real,0) = x
    | doubleExp(x,i) = potenza(x,esponenziale(i));

doubleExp(1.1,3);



fun sumList(nil) = (0,0)
    | sumList(x::nil) = (x,0)
    | sumList(x::y::zs) =
        let
            val (M,N) = sumList(zs);
        in
            (x+M, y+N)
        end;

sumList([1,2,3,4]);
sumList([1,2,3]);
sumList([]);



fun printList(nil) = print("")
    | printList(x::xs) = (print(Int.toString(x)); print("\n"); printList(xs));

printList(nil);
printList([1,2,3]);



fun factorial (1) = 1
    | factorial (n) = n*factorial(n-1);

fun comb_aux(n,m) = factorial(n) div (factorial(m)*factorial(n-m));

fun comb(n,m) = (print("n is "); print(Int.toString(n)); print("\n");
                 print("m is "); print(Int.toString(m)); print("\n");
                 print("Result is "); print(Int.toString(comb_aux(n,m))); print("\n"));

comb(5,2);



fun printXs 0 = print("X")
    | printXs n = (printXs(n-1); printXs(n-1));

printXs(3);
printXs(4);

(* ------------------------------- ESERCIZI LABORATORIO 6 ------------------------------- *)

val infile = TextIO.openIn("filename");

(*
val infile = TextIO.openIn("filename");

fun getWord_aux (infile, NONE) = nil
    | getWord_aux (infile, SOME #" ")= nil
    | getWord_aux (infile, SOME #"\n")= nil
    | getWord_aux (infile, SOME c) = c::getWord_aux(infile, TextIO.input1 (infile));

fun getWord(infile) = getWord_aux(infile, TextIO.input1(infile));

getWord(infile); (* Chiamata della funzione *)

TextIO.closeIn(infile); (* chiude la lettura da stream *)
*)

fun getWord(infile, NONE) = nil
    | getWord(infile, SOME #" ")= nil
    | getWord(infile, SOME #"\n")= nil
    | getWord(infile, SOME c) = c::getWord(infile, TextIO.input1 (infile));


fun getListAux(infile, NONE) = nil
    | getListAux(infile, SOME c) = implode(getWord(infile, SOME c))::getListAux(infile,TextIO.input1(infile));

fun getList(infile) = getListAux(infile, TextIO.input1(infile));


getList(infile);

TextIO.closeIn(infile); (* chiude la lettura da stream *)



exception TooShort of int list;

fun len(l) = if l=[] then 0 else 1+len(tl(l));

fun returnThird1(L) = if len(L)<3 then raise TooShort(L) else hd(tl(tl(L)));

fun returnThird(L) = returnThird1(L) handle TooShort(L) => (print("List too short."); print ("\n"); 
                                                            print("It only contains "); print(Int.toString(len(L))); print(" elements."); print ("\n"); 0);

returnThird([1,2,3,4]);
returnThird([1,2]);



exception Negative of int;

fun fattoriale1 (0) = 1
    | fattoriale1 (n) = if n<0 then raise Negative(n) else n*fattoriale1(n-1);

fun fattoriale(n) = fattoriale1(n) handle Negative(n) => (print("Negative arguments "); print(Int.toString(n)); print(" found."); print ("\n"); 0);

fattoriale(5);
fattoriale(0);
fattoriale(~2);



fun tabulate1(a, inc, 0, F, i) = print ("")
    | tabulate1(a, inc, n, F, i) = 
        let
            val x = a + (real(i)*inc);
            val fx = F(x);
            val ric = tabulate1(a, inc, n-1, F, i+1);
        in
            (print(Real.toString(x)); print(" "); print(Real.toString(fx)); print ("\n"))
        end;

fun tabulate(a, inc, n, F) = tabulate1(a, inc, n, F, 0);

tabulate(1.0, 0.1, 9, fn x => x*x);
tabulate(1.0, 0.0, 9, fn x => x*x);
tabulate(1.0, 0.0, 0, fn x => x*x);
tabulate(1.0, 0.1, 0, fn x => x*x);
tabulate(1.0, 0.1, 0, fn x => x*x);