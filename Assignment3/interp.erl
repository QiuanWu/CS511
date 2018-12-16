% Team: Kexian Wu & Qiuan Wu
% I pledge my honor that I have abided by the Stevens Honor System.

-module(interp).
-export([scanAndParse/1,runFile/1,runStr/1]).
-include("types.hrl").

loop(InFile,Acc) ->
    case io:request(InFile,{get_until,prompt,lexer,token,[1]}) of
        {ok,Token,_EndLine} ->
            loop(InFile,Acc ++ [Token]);
        {error,token} ->
            exit(scanning_error);
        {eof,_} ->
            Acc
    end.

scanAndParse(FileName) ->
    {ok, InFile} = file:open(FileName, [read]),
    Acc = loop(InFile,[]),
    file:close(InFile),
    {Result, AST} = parser:parse(Acc),
    case Result of 
	ok -> AST;
	_ -> io:format("Parse error~n")
    end.


-spec runFile(string()) -> valType().
runFile(FileName) ->
    valueOf(scanAndParse(FileName),env:new()).

scanAndParseString(String) ->
    {_ResultL, TKs, _L} = lexer:string(String),
    parser:parse(TKs).

-spec runStr(string()) -> valType().
runStr(String) ->
    {Result, AST} = scanAndParseString(String),
    case Result  of 
    	ok -> valueOf(AST,env:new());
    	_ -> io:format("Parse error~n")
    end.


-spec numVal2Num(numValType()) -> integer().
numVal2Num({num, N}) ->
    N.

-spec boolVal2Bool(boolValType()) -> boolean().
boolVal2Bool({bool, B}) ->
    B.

-spec valueOf(expType(),envType()) -> valType().
%% valueOf(Exp,Env) ->
%%     io:format("Not implemented!").


valueOf({num, N}, _Env) ->
    {num, N};

valueOf({bool, B}, _Env) ->
    {num, B};

valueOf({numExp, {num, _, N}}, _Env) ->
    {num, N};

valueOf({idExp, {id, _, Id}}, Env) ->
    env:lookup(Env, Id);

valueOf({plusExp, Exp1, Exp2}, Env) ->
    N = numVal2Num(valueOf(Exp1, Env)) + numVal2Num(valueOf(Exp2, Env)),
	{num, N};

valueOf({diffExp, Exp1, Exp2}, Env) ->
    N = numVal2Num(valueOf(Exp1, Env)) - numVal2Num(valueOf(Exp2, Env)),
	{num, N};

valueOf({isZeroExp, Exp}, Env) ->
	Flag = (numVal2Num(valueOf(Exp, Env)) =:= 0),
	{bool, Flag};

valueOf({ifThenElseExp, Exp1, Exp2, Exp3}, Env) ->
	Flag = boolVal2Bool(valueOf(Exp1, Env)),
	if Flag =:= true -> valueOf(Exp2, Env);
		true -> valueOf(Exp3, Env)
  	end;
		 
valueOf({letExp, Identifier, Exp1, Exp2}, Env) ->
	{id, _, Id} = Identifier,
	valueOf(Exp2, env:add(Env, Id, valueOf(Exp1, Env)));
	
valueOf({procExp, Identifier, Exp1}, Env) ->
	{id, _, Id} = Identifier,
	{proc, Id, Exp1, Env};

valueOf({appExp, ProcExp, ValExp}, Env) ->
	{proc, Id, Exp, ProcEnv} = valueOf(ProcExp, Env),
	Identifier = {id, 1, Id},
	valueOf({letExp, Identifier, ValExp, Exp}, ProcEnv).

