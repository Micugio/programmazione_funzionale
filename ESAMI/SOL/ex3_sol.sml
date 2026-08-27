(*
    ESERCIZIO ESAME 3
    Testo:
    Write a function called sum_binary (of type int list * int list -> int list)
    that takes as input a pair of lists of integers, which represent a number in binary form,
    and returns the binary number that represents the sum of the two input numbers, also as an int list of 1s and 0s.

    Note:
    The use of the "+" operator is not permitted within the program,
    but only logical operators such as "andalso", "orelse" and the comparison operator "=".
*)

fun reverse [] = []
    | reverse (h::t) = (reverse t) @ [h];

(* NOTA: nel risultato il 1^ elemento della tupla è il riporto (carry) mentre il 2^ elemento della tupla è la somma. *)
fun bit_sum (0,0,0) = (0,0)
    | bit_sum (1,0,0) = (0,1)
    | bit_sum (0,1,0) = (0,1)
    | bit_sum (0,0,1) = (0,1)
    | bit_sum (1,1,0) = (1,0)
    | bit_sum (1,0,1) = (1,0)
    | bit_sum (0,1,1) = (1,0)
    | bit_sum (1,1,1) = (1,1)
    | bit_sum _ = (0,0);

fun aux_sum_binary ([], [], 0) = []
    | aux_sum_binary ([], [], c) = [c]
    | aux_sum_binary ((h::t), [], c) =
        let
            val (new_c, bit) = bit_sum(h,0,c);
        in
            bit::aux_sum_binary(t,[],new_c)
        end
    | aux_sum_binary ([], (h::t), c) =
        let
            val (new_c, bit) = bit_sum(h,0,c);
        in
            bit::aux_sum_binary(t,[],new_c)
        end
    | aux_sum_binary ((h1::t1), (h2::t2), c) =
        let
            val (new_c, bit) = bit_sum(h1,h2,c);
        in
            bit::aux_sum_binary(t1,t2,new_c)
        end;

fun sum_binary (l1, l2) =
    reverse (aux_sum_binary (reverse l1, reverse l2, 0));


(* ESEMPIO ESECUZIONE: *)
sum_binary([],[]); (* = [] *)
sum_binary([1,0],[1,0]); (* = [1,0,0] *)
sum_binary([1,0],[0]); (* = [1,0] *)
sum_binary([0],[1,0]); (* = [1,0] *)
sum_binary([1,0,0,0],[1,0]); (* = [1,0,1,0] *)
sum_binary([1,0,1,1],[1,1,1]); (* = [1,0,0,1,0] *)
