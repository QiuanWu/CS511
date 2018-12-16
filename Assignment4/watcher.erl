-module(watcher).
-compile(export_all).
-author("Qiuan Wu & Kexian Wu").
%% Pledge: I pledge my honor that I have abided by the Stevens Honor System

start() ->
    {ok, [ N ]} = io:fread("enter number of sensors> ", "~d") ,
    if N =< 1 ->
          io:fwrite("setup: range must be at least 2~n", []) ;
    true -> 
        Num_watchers = 1 + (N div 10),
        setup_loop(N, Num_watchers, 0)
    end. 

setup_loop(N, Num_watchers, StartId) when Num_watchers == 1 ->
        spawn(watcher, spawn_watcher, [N, StartId]);
setup_loop(N, Num_watchers, StartId) ->
        spawn(watcher, spawn_watcher, [10, StartId]),
        setup_loop(N - 10, Num_watchers - 1, StartId + 10).

spawn_watcher(NumOfSensors, Id) ->
    PidList = spawn_sensor(Id, NumOfSensors, []),
    io:fwrite("Watcher starts: ~p~n", [PidList]),
    start_watch(PidList).

spawn_sensor(_, NumOfSensors, SensorList) when NumOfSensors == 0 ->
        SensorList;
spawn_sensor(Id, NumOfSensors, SensorList) ->
        {Pid, _} = spawn_monitor(sensor, createSensor, [Id, self()]),
        spawn_sensor(Id+1, NumOfSensors-1, lists:append(SensorList, [{Id, Pid}])).

start_watch(PidList) ->
    receive 
        {'DOWN', _Ref, _Process, Pid2, Reason} ->
            {Id, Pid} = lists:keyfind(Pid2, 2, PidList),
            io:fwrite("Sensor ~p has crashed with reason: ~p. ~n", [Id, Reason]),
            io:fwrite("Sensor ~p is reatarting...~n", [Id]),
            PidList1 = lists:delete({Id, Pid}, PidList),
            {Pid3, _} = spawn_monitor(sensor, createSensor, [Id, self()]),
            PidList2 = lists:append(PidList1, [{Id, Pid3}]),

            io:fwrite("Updated sensor list ~p~n", [PidList2]),
            start_watch(PidList2);
        {_From, {Id, Measurement}} ->
            io:fwrite("Sensor ~p measurement: ~p~n", [Id, Measurement]),
            start_watch(PidList)   
    end.
            
