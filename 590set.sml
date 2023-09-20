(*SET of E
For this one, write axioms, and then write ML for them. Make it polymorphic.

the operations in SET : new, add, rem, mem, card
new makes an empty SET
add put an element of type E into a set
rem takes an element of type E out of the set
mem (member) tells if a particular element of type E is in the set or not
card (cardinality) gives the number of items in the set

Remember the semantics of normal sets. 
When you add an item to a set and the item is already in the set, you do not change the set membership. 
The item is still in the set after the add... there is no notion of adding a second instance of the item.*)


(*
SET of E
signatures (operations and types of parameters/return value)

   new:              --> SET
   add:  SET x E     --> SET 

   rem:  SET x E     --> SET
   mem:  SET x E     --> boolean
   card: SET         --> nat (naturals, int >=0 )

axioms (behavior)

  rem(new, t) = new
  rem(add(S,e), t) = if (t!=e) then add(rem(S,t),t) 
                     else if (mem(S, t)) then rem(S,t) 
                     else S

  mem(new, t) = false
  mem(add(S,e), t) = if(e = t) then true
                     else mem(S,t)

  card(new) = 0
  card(add(S,e)) = if (mem(S, e)) then card(S)
                   else card(S) + 1                                     

*)

datatype ('e)SET = new
|                  add of ('e)SET * ('e);

fun mem(new, t) = false
|   mem(add(S,e), t) = if(e = t) then true
                       else mem(S,t);

fun card(new) = 0
|   card(add(S,e)) = card(S) + 1;