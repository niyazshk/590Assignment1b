(*

   SET of E
 
   New:    --> SET
   Insert: SET x E --> SET
   remove: SET x E --> SET
   member: SET x E --> boolean
   card SET —> INT 

axioms (Behavior)
 
rem(new, i) = new
 rem( add(s,j), i ) = if i=j 
                then remove(s,i)
                else add(rem(s,i), j) ;

mem(new, i) = false 
member (add(s,j), i ) = if i=j 
                         then true 
                         else mem(s,i);

*)

