(* Es. 7.1*)
(* Funzione curried per moltiplicare 3 numeri *)
fun curry F x1 x2 x3 = F(x1,x2,x3);

curry (fn (x,y,z)=>x*y*z) 1 2 3;

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 7.2*)
(* Uso funzione predefinita map per trasformare una lista di int in real *)
fun toReal L = map real L;

toReal ([1,2,3]);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)

(* Es. 7.3*)
(*  *)
fun andb (x::y::zs) = foldr x andalso y;

andb([true,false,true]);

val _ = print ("\n");
(* ---------------------------------------------------------------------------- *)
