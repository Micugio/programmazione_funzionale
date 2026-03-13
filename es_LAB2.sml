(* Esercizio L2.1 *)
fun cubo (x:real) = x*x*x;

cubo(5.0);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Esercizio L2.2 *)
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

(* Esercizio L2.3 *)
fun terzo_elem (lista) = hd(tl(tl(lista)));

terzo_elem([1,2,3]);
terzo_elem([1,2,3,4]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Esercizio L2.4 *)
fun inverti (a,b,c) = (c,b,a);

fun inverti_tupla (t:'a*'b*'c) = (#3(t),#2(t),#1(t));

inverti(1,2,3);
inverti_tupla (("a", 2, 1.0));

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Esercizio L2.5 *)
fun terzo_char (stringa) = str(hd(tl(tl(explode(stringa)))));

fun terzo_char_fx (stringa) = str(terzo_elem(explode(stringa)));

terzo_char ("ciao");
terzo_char_fx ("bella");

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Esercizio L2.6 *)
fun ciclo (stringa) = tl(stringa)@[hd(stringa)];

ciclo ([1,2,3,4]);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)

(* Esercizio L2.7 *)
fun min_max_tupla (x,y,z) = (min3prof(x,y,z), max3prof(x,y,z));

min_max_tupla (1,5,22);

val _ = print "\n";
(* ---------------------------------------------------------------------------- *)
