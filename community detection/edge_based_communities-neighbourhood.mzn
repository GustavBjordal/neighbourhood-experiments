include "../ls-annotation.mzn";


int:n;
set of int: NODE = 1..n;
int:k;
set of int: COMMUNITY = 1..k;
int:maxsize;
array[int,1..2] of int:ML;
array[int,1..2] of int:CL;
set of int: must=index_set_1of2(ML);
set of int: cannot=index_set_1of2(CL);
array[int,1..2] of NODE: E; 
set of int: EDGE = index_set_1of2(E);
int: m = card(EDGE) + sum(e in EDGE)(E[e,1] = E[e,2]);              % 2 times number of edges

array[NODE] of set of NODE: nbh =[ {E[e,2] | e in EDGE where E[e,1] = i } | i in NODE];
array[NODE] of int: deg = [ card(nbh[i]) | i in NODE];

array[NODE]of var COMMUNITY:x;
var COMMUNITY: used = max(x);

include "global_cardinality_low_up.mzn";
include "value_precede_chain.mzn";
constraint symmetry_breaking_constraint(value_precede_chain(COMMUNITY,x));
constraint forall(m in must)(x[ML[m,1]]=x[ML[m,2]]);
constraint forall(c in cannot)(x[CL[c,1]]!=x[CL[c,2]]);
constraint global_cardinality_low_up(x,[i|i in 1..k],[0|i in 1..k],[maxsize|i in 1..k]);

array[COMMUNITY] of var int: eii = 
                [ sum(e in EDGE)(x[E[e,1]] = i /\ x[E[e,2]] = i) |  i in COMMUNITY];
array[COMMUNITY] of var int: aii = 
                [ sum(s in NODE)(deg[s] * (x[s] = i)) | i in COMMUNITY ];
      
var int: OBJ;
constraint OBJ = sum(i in COMMUNITY)(m*eii[i]- aii[i]*aii[i]);


solve 
 :: neighbourhood_and([community_cannot()]) 
maximize OBJ;

output["x=", show(x),
      "\nOBJ=", show(OBJ),
      "\nused=", show(used)
      ];
      
      

function ann: community_cannot() :: neighbourhood_definition =
initialize(
 forall(m in must)(x[ML[m,1]]=x[ML[m,2]]) /\
 forall(c in cannot)(x[CL[c,1]]!=x[CL[c,2]]) 
 /\
  global_cardinality_low_up(x,[i|i in 1..k],[0|i in 1..k],[maxsize|i in 1..k]) 
 )
/\
from(i in 1..n, c in 1..k )(x[i] := c);
