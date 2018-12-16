-module(cr_lea).
-compile(export_all).
-author("Kexian Wu & Qiuan Wu").
% I pledge my honor that I have abided by the Stevens Honor System.

% generate unique, random numbers    
setup_loop(0, _, PidList) -> 
    io:fwrite("Pid List: ~p~n",[PidList]),
    PidList;
setup_loop(N, IdList, PidList) ->
    RandId = lists:nth(rand:uniform(length(IdList)), IdList),
    Pid = spawn(?MODULE, nnode, [RandId, self()]),
    setup_loop(N-1, lists:delete(RandId, IdList), lists:append(PidList, [Pid])).

start(N) ->
    IdList = lists:seq(1,N),
    PidList = setup_loop(N, IdList, []),
    [Pid ! {self(), getNextNode, lists:nth(((string:str(PidList, [Pid]) rem length(PidList)) + 1), PidList)} || Pid <- PidList],
    [Pid ! {self(), allIn} || Pid <- PidList].

nnode(Mynumber, NextNode) -> 
    receive
        {_From, getNextNode, NextPid} -> 
            receive 
                {_From, allIn} ->
                    io:fwrite("Next Node Pid: ~p ~n", [NextPid]),
                    NextPid!{elect, Mynumber},
                    nnode(Mynumber, NextPid)
            end;
        {elect, Num} ->
            if
                Num == Mynumber -> 
                    NextNode!{leader, Num},
                    io:fwrite("Node ~p is elected as leader ~n", [Mynumber]);
                Num > Mynumber -> 
                    NextNode!{elect, Num},
                    nnode(Mynumber, NextNode);
                true -> 
                    nnode(Mynumber, NextNode)
            end;
        {leader, Num} -> io:fwrite(" MSC: I am node ~p and I know the leader is ~p ~n", [Mynumber, Num]),
                         NextNode!{leader, Num}
    end.