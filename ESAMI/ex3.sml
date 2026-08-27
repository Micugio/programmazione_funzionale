fun rev_num(nil) = nil
    | rev_num(x::xs) = rev_num(xs)@[x];

fun sum_binary1(nil,nil,0) = nil
    | sum_binary1(nil,nil,1) = [1]
    | sum_binary1(nil,L2,0) = L2
    | sum_binary1(nil,L2 as y::ys,1) = if y=0 then 1::ys else 0::sum_binary1(nil,ys,1)
    | sum_binary1(L1,nil,0) = L1
    | sum_binary1(L1 as x::xs,nil,1) = if x=0 then 1::xs else 0::sum_binary1(xs,nil,1)
    | sum_binary1(0::xs,1::ys,0) = 1::sum_binary1(xs,ys,0)
    | sum_binary1(0::xs,1::ys,1) = 0::sum_binary1(xs,ys,1)
    | sum_binary1(1::xs,0::ys,0) = 1::sum_binary1(xs,ys,0)
    | sum_binary1(1::xs,0::ys,1) = 0::sum_binary1(xs,ys,1)
    | sum_binary1(0::xs,0::ys,0) = 0::sum_binary1(xs,ys,0)
    | sum_binary1(0::xs,0::ys,1) = 1::sum_binary1(xs,ys,0)
    | sum_binary1(1::xs,1::ys,0) = 0::sum_binary1(xs,ys,1)
    | sum_binary1(1::xs,1::ys,1) = 1::sum_binary1(xs,ys,1);

fun sum_binary(L1,L2) = rev(sum_binary1(rev_num(L1),rev_num(L2),0));


sum_binary([],[]); (* = [] *)
sum_binary([1,0],[1,0]); (* = [1,0,0] *)
sum_binary([1,0],[0]); (* = [1,0] *)
sum_binary([0],[1,0]); (* = [1,0] *)
sum_binary([1,0,0,0],[1,0]); (* = [1,0,1,0] *)
sum_binary([1,0,1,1],[1,1,1]); (* = [1,0,0,1,0] *)
