annotation new_constraint_context;
%Neighbourhood flattening annotation
annotation flat_function;
annotation ls_dummy;
annotation ls_initialize;
annotation ls_defines_generator;
annotation ls_pre_condition;
annotation ls_post_condition;
annotation ls_move(ann: moves);
annotation neighbourhood_or(ann: x, ann:y);
annotation neighbourhood_or(array[int] of ann: X);
annotation neighbourhood_and(ann: x, ann:y);
annotation neighbourhood_and(array[int] of ann: X);
annotation neighbourhood_definition;
annotation neighbourhood_declaration(array[int] of ann: neighbourhoods,  ann: initialize);
annotation neighbourhood_declaration(array[int] of ann: neighbourhoods);
%Moves
function ann: swap_array(array[int] of var int: Xs1, var int: i, array[int] of var int: Xs2, var int: j);
function ann: assign_array(array[int] of var int: Xs, var int: i, var int: v);
function ann: assign(var int, var int);
function ann: swap(var int, var int);

function ann: swap_array(array[int] of var bool: Xs1, var int: i, array[int] of var bool: Xs2, var int: j);
function ann: assign_array(array[int] of var bool: Xs, var int: i, var bool: v);
function ann: assign(var bool, var bool);
function ann: swap(var bool, var bool);

function ann: from(array[int] of ann);
function ann: from(array[int] of var opt ann);
function ann: initialize(var bool);
function ann: initialize(ann);
function ann: forall(array[int] of ann: X) = neighbourhood_and(X);
function ann: '/\' (ann:x,ann:y);
function ann: '\/' (ann:x,ann:y);
function ann: ensure(ann:e);

function ann: ':='(var int: lhs, var int: rhs);
function ann: ':=:'(var int: lhs, var int: rhs);