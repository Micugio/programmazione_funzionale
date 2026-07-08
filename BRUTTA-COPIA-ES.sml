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



fun duplicate (l) = if l = [] then []
                    else [hd(l),hd(l)] @ duplicate(tl(l));

duplicate([1,2,3,4]);



fun len (l) = if l = [] then 0
              else 1+len(tl(l));

len([1,2,3,4]);



fun pow (x, i) = if i = 0 then 1.0
                 else x*pow(x,i-1);

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
