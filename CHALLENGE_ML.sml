datatype cell = Alive | Dead
type grid = cell list list

fun count (nil) = 0
    | count (x::xs) = 1 + count(xs);

fun n_rows (G:grid) = count(G);

val myGrid = [
    [Alive, Dead],
    [Dead, Alive],
    [Alive, Dead]
];

val righe = n_rows(myGrid);

fun n_cols (G:grid) = count(List.nth(G,0));

val colonne = n_cols(myGrid);

fun cell_at_x_y (G:grid, x:int, y:int) = if ((x < 0 orelse x >= n_rows(G)) orelse (y < 0 orelse y >= n_cols(G))) then Dead else List.nth(List.nth(G,x),y);


fun is_alive (G:grid, dx, dy, x, y) = case cell_at_x_y (G, x+dx, y+dy) of Alive => 1 | Dead  => 0;

fun count_live_neighbours (G:grid, x:int, y:int) = 
    let
        val offsets = [(~1,~1),(~1,0),(~1,1),
                        (0,~1),       (0,1),
                        (1,~1),(1,0),(1,1)]
    in
        foldl (fn ((dx, dy), acc) => acc + is_alive(G, dx, dy, x, y)) 0 offsets
    end

val vicini_vivi = count_live_neighbours(myGrid, 1, 0);

fun cell_next_state (G:grid, x:int, y:int) =
    let
        val alive_n = count_live_neighbours (G, x, y)
        val current = cell_at_x_y (G, x, y)
    in
        case current of
            Alive => if alive_n = 2 orelse alive_n = 3 then Alive else Dead | Dead  => if alive_n = 3 then Alive else Dead
    end

val stato_prox_cell = cell_next_state(myGrid, 1, 0);


fun range (n : int) : int list =
    let
        fun aux 0 acc = acc
          | aux k acc = aux (k - 1) ((k - 1) :: acc)
    in
        aux n []
    end
 
fun map_list (f : 'a -> 'b) (lst : 'a list) : 'b list =
    foldl (fn (x, acc) => acc @ [f x]) [] lst
 
fun next_gen (G:grid) : grid =
    let
        val rows = n_rows(G)
        val col_counts = n_cols(G)
 
        fun next_row (r : int) : cell list = map_list (fn c => cell_next_state (G,r,c)) (range col_counts)
    in
        map_list next_row (range rows)
    end


val gen = next_gen (myGrid);

fun cell_to_string (c : cell) : string =
    case c of
        Alive => "O"
      | Dead  => "."
 
fun print_row (row : cell list) : unit = (List.app (fn c => print (cell_to_string c)) row; print "\n")
 
fun print_grid (G : grid) : unit = List.app print_row G;

fun run_generations (G:grid, n:int) : unit = 
    if (n <= 0) then ()
    else
        let
            val gen_num = n
            val _ = print ("--- Generazione ---\n")
            val _ = print_grid G
            val _ = print "\n"
        in
            run_generations(next_gen G, n-1)
        end

val () =
    (print "=== Conway's Game of Life in SML (PolyML) ===\n\n";
     print "Griglia iniziale:\n";
     print_grid(myGrid);
     print "\n";
     run_generations (next_gen(myGrid), 4))
