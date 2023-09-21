(*
    Map of ELT, KYT
    
    new: --> MAP
    add: MAP x KYT x ELT --> MAP
    del: Map x KYT --> MAP
    get: MAP x KYT --> ELT U null
    empty: MAP --> boolean
    clear: MAP --> MAP
    size: MAP --> nat
    hasKey: Map x KYT --> boolean
    hasVal: MAP x ELT --> boolean
*)

datatype ('KYT, 'ELT)MAP =
        new
        | add of ('KYT, 'ELT)MAP * 'KYT * 'ELT;

fun get(new, k) = NONE
|   get(add(M,k,e),g) = 
        if (k=g) then SOME e 
        else get(M,g);

fun empty(new) = true
|   empty(add(M,k,e)) = false;

fun clear(new) = new
|   clear(add(M,k,e)) = new;

fun hasKey(new,k) = false
|   hasKey(add(M,k,e),g) = if (k=g) then true
                           else hasKey(M,g);

fun del(new,k) = new
|   del(add(M,k,e),g) = if (k<>g) then add(del(M,g),k,e)
                        else if(hasKey(M,k)) then del(M,k)
                        else M;

fun size(new) = 0
|   size(add(M,k,e)) = if (hasKey(M,k)) then size(M)
                       else size(M) + 1;

fun hasVal(new,v) = false
|   hasVal(add(M,k,e), v) = if (e=v) then true
                            else hasVal(M,v);
