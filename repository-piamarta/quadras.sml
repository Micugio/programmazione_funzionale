fun cubo x:real = x*x*x;

cubo(5.0);

fun min3 (x,y,z) = 
    if x<y then 
        if x<z then 
            x
        else 
            z
    else
        y; 
            
min3(5,3,2);
min3(1,3,2);
min3(5,3,1);

fun third a = 
    hd(tl(tl(a)));

val it = [1,2,3,4];
third(it);

fun reverse (x,y,z) = 
    (z,y,x);

reverse(1,2,3);

fun thirdchar stri = 
    str(third(explode(stri)));

thirdchar("ciao");

fun cycle x = 
    tl(x)@[hd(x)];

cycle([1,2,3]);

fun minmaxpair (x,y,z) =
    (min3(x,y,z),(~(min3(~x,~y,~z))));

minmaxpair (3,2,1);

fun mid (x,y,z) = 
    if x < y andalso y > z orelse x > y andalso y < z then 
        z
    else if y > x andalso y < z orelse y < x andalso y > z then
        y
    else z

fun sort (x,y,z) =
    (min3(x,y,z),mid(x,y,z),(~(min3(~x,~y,~z))));
    
sort(1,4,2);

fun roun x:real = 
    if floor(x*10.0) = floor(x*10.0+0.5) then 
    real(floor(x*10.0))/10.0 
    else 
    (real(floor(x*10.0))/10.0)+0.1;

roun (3.1);
roun (3.32);
roun (3.35);

fun rem x = 
    [hd(x)]@tl(tl(x));

rem([1,2,3]);