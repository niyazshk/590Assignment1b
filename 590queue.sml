datatype ('e)QUEUE=
new
| enq of ('e)QUEUE * 'e;
fun empty(new) = true
|   empty(enq(Q,e)) = false;

fun size(new) = 0
|   size(enq(Q,e)) = size(Q) + 1;

exception backEmptyQueue;

fun back(new) = raise backEmptyQueue
|   back(enq(Q,e)) = e;

exception frontEmptyQueue;
fun front(new) = raise frontEmptyQueue
|   front(enq(Q,e)) = if(empty(Q)) then e
else front(Q);

fun deq(new) = new
|   deq(enq(Q,e)) = if (empty(Q)) then new
else enq(deq(Q),e);