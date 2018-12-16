# define N 5 /* number of processes in the ring */
# define L 10 /* size of buffer ( >= 2*N) */
byte I ; /* will be used in init for assigning ids to nodes */

mtype = {elect, leader}; 
chan q[N] = [L] of { mtype , byte }; /* asynchronous channels */

proctype nnode (chan inp, out; byte mynumber) 
{
    byte nr;
    xr inp ; /* channel assertion : exclusive recv access to channel in */
    xs out ; /* channel assertion : exclusive send access to channel out */
    printf("MSC: %d\n", mynumber);
    out!elect(mynumber); /* send(id) to next process in ring */
    end:    do

        :: inp?elect(nr) ->
                if 
                :: nr == mynumber -> out!leader(nr); /* process is the leader */
                                     break
                :: nr > mynumber -> out!elect(nr) /* forward identifier, id becomes passive */ 
                :: nr < mynumber -> skip /* purge message */
                fi
        :: inp?leader(nr) ->
            if
            :: nr == mynumber -> printf("MSC: %d is the leader\n", mynumber);
            :: nr != mynumber -> printf("MSC: I am node %d and I know the leader is %d\n", mynumber, nr);
                                out!leader(nr)
            fi
        od
}

init {
  byte proc;
  byte Ini[6]; /* N <=6 randomize the process numbers */
  atomic {
    I = 1; /* pick a number to be assigned 1.. N */
    do
    :: I <= N ->
          if /* non - deterministic choice */
          :: Ini [0] == 0 && N >= 1 -> Ini [0] = I
          :: Ini [1] == 0 && N >= 2 -> Ini [1] = I
          :: Ini [2] == 0 && N >= 3 -> Ini [2] = I
          :: Ini [3] == 0 && N >= 4 -> Ini [3] = I
          :: Ini [4] == 0 && N >= 5 -> Ini [4] = I
          :: Ini [5] == 0 && N >= 6 -> Ini [5] = I /* works for up to N=6 */
          fi;
          I ++
    :: I > N -> /* assigned all numbers 1..N */
          break
    od;
    /* start all nodes in the ring */
    proc = 1;
    do
    :: proc <= N ->
          run nnode (q[proc-1], q[proc%N], Ini[proc-1]);
          proc++
    :: proc > N ->
          break
    od
  }
}