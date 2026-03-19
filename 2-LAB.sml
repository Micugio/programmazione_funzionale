(* Es. 2.1 *)
fun cubo (x:real) = x*x*x;

cubo(5.0);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 2.2 *)
fun min3 (x,y,z) =
if x<y then 
    if x<z then
        x
    else
        z
else
    if y<z then
        y
    else 
        z;

fun min3prof (x,y,z) = if x<y then 
                           if x<z then x else z
                       else
                        if y<z then y else z;

min3(2,4,5);
min3(4,2,5);
min3(5,4,2);
min3prof(1,2,3);

fun max3prof (x,y,z) = if x>y then 
                           if x>z then x else z
                       else
                        if y>z then y else z;



val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 2.3 *)
fun terzo_elem (lista) = hd(tl(tl(lista)));

terzo_elem([1,2,3]);
terzo_elem([1,2,3,4]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 2.4 *)
fun inverti (a,b,c) = (c,b,a);

fun inverti_tupla (t:'a*'b*'c) = (#3(t),#2(t),#1(t));

inverti(1,2,3);
inverti_tupla (("a", 2, 1.0));

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 2.5 *)
fun terzo_char (stringa) = str(hd(tl(tl(explode(stringa)))));

fun terzo_char_fx (stringa) = str(terzo_elem(explode(stringa)));

terzo_char ("ciao");
terzo_char_fx ("bella");

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 2.6 *)
fun ciclo (stringa) = tl(stringa)@[hd(stringa)];

ciclo ([1,2,3,4]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 2.7 *)
fun min_max_tupla (x,y,z) = (min3prof(x,y,z), max3prof(x,y,z));

min_max_tupla (1,5,22);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 2.8 *)
(* fun mid3 (a,b,c) = if (a<b andalso b<c) orelse (a<b andalso b<a) then b else if (b<c andalso a<c); *)


val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 2.9 *)
fun rnd (x) = real(round(x*10.0))/10.0; (* faccio real(round()) perchè round restiuisce un int MA io voglio un real *)

rnd (2.56);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Es. 2.10 *)
(* Rimuove il secondo elemento della lista *)
fun rem x = hd(x)::tl(tl(x));

rem([1,2]);
