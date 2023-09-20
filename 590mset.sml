(*MSET of E
Example:
S: 2, 6, 6, 6, 9, 9, 12
add 9 to S: 2, 6, 6, 6, 9, 9, 9, 12
rem 6 from S: 2, 6, 6, 9, 9, 9, 12
card of S: 7
mem 6 in S: 2
mem 12 in S: 1
mem 10 in S: 0

the operations in SET : new, add, rem, mem, card

new makes an empty SET
add put an element of type E into a set

rem  

takes a single instance of an item from the mset; 
the removed item might still be in the mset (if it was in more than one time).
When an item is in the mset one time, and is removed, it is no longer in the mset.

mem (member) returns an Int and tells how many times an item is in the MSET (0 means it is not in the MSET)

card (cardinality) gives the number of items in the set. 
If we add an item twice, then the count for that item is 2...
card tells how many items are in the MSET (counting every instance of every item)
*)


(*
MSET of E
signatures (operations and types of parameters/return value)

   new:              --> MSET
   add:  MSET x E     --> MSET 

   rem:  MSET x E     --> MSET
   mem:  MSET x E     --> int
   card: MSET         --> nat (naturals, int >=0 )

axioms (behavior)

  rem(new, t) = new
  rem(add(M,e), t) = if (t!=e) then add(rem(M,t),t) 
                     else if (mem(M, t) <> 0) then rem(M,t) 
                     else M

  mem(new, t) = 0
  mem(add(M,e), t) = if(e = t) then 1 + mem(M,t)
                     else mem(M,t)

  card(new) = 0
  card(add(M,e)) = card(M) + 1                                     

*)

datatype ('e)MSET = new
|                  add of ('e)MSET * ('e);


fun mem(new, t) = 0
|   mem(add(M,e), t) = if(e = t) then 1+mem(M,t)
                       else mem(m,t);

fun rem(new, t) = new
|   rem(add(M,e), t) = if (t!=e) then add(rem(M,t),e)
                       else M;

fun card(new) = 0
|   card(add(M,e)) = card(M) + 1;