include "globals.mzn";
include "../ls-annotation.mzn";

int: nItems;
set of int: ITEMS;
set of int: BINS;
set of int: COLORS ;
set of int: CAPACITIES ;

array [CAPACITIES] of int: capacities;
array [ITEMS] of int: size;
array [ITEMS] of COLORS: color;
int: maxCapa = max(capacities);

array [BINS] of var 0..maxCapa: load;
array [ITEMS] of var BINS: placed_in;
constraint bin_packing_load(load,placed_in,size);


 int: maxColors = 2;
 array[BINS] of var 0..maxColors: num_colors;

constraint forall( b in BINS)(
  num_colors[b] = sum( [ exists(i in ITEMS where color[i] = c)(placed_in[i] = b) | c in COLORS ]) 
);

array[0..maxCapa] of 0..maxCapa: slack =
  array1d(0..maxCapa,[min([s | s in capacities++[0] where s >= x]) - x | x in 0..maxCapa]);

var int: objective;
constraint objective = sum(i in BINS)(slack[load[i]]);

solve 
:: neighbourhood_and([hard_packing(placed_in)]) 
minimize objective;

function ann: hard_packing(array [int] of var int: placed) :: neighbourhood_definition =
initialize(
  forall(i in ITEMS)( int_eq(placed[i], i))
)
/\
from(i in ITEMS, b in BINS where slack[load[placed[i]]] > 0 /\ size[i]+load[b] <= maxCapa)
  (   
    placed[i] := b /\
    ensure(num_colors[b] <= 2)
);