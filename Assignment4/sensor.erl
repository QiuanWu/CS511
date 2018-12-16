-module(sensor).
-compile(export_all).
-author("Qiuan Wu & Kexian Wu").
%% Pledge: I pledge my honor that I have abided by the Stevens Honor System

createSensor(ID, Watcher) ->
    Measurement = rand:uniform(11),
    if Measurement == 11 ->
        exit(anomalous_reading);
    true ->
         Watcher ! {self(), {ID, Measurement}}
    end,
    timer:sleep(rand:uniform(10000)),
    createSensor(ID, Watcher).