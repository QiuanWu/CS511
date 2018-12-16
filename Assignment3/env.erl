% Team: Kexian Wu & Qiuan Wu
% I pledge my honor that I have abided by the Stevens Honor System.

-module(env).
-compile(export_all).
-include("types.hrl").


-spec new()-> envType().
new() ->
	dict:new().

-spec add(envType(),atom(),valType())-> envType().
add(Env,Key,Value) ->
    dict:store(Key, Value, Env). % If Key already exists in Dict1, the associated value is replaced by Value.

-spec lookup(envType(),atom())-> valType().
lookup(Env,Key) -> 
   dict:fetch(Key,Env). 
% This function assumes that Key is present in dictionary Dict, and an exception is generated if Key is not in the dictionary.