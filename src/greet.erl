-module(greet).

-export([greet/1]).

%% Stop condition to return when reaching an empty list
greet([]) ->
    true;
%% Implement a loop recursively
greet([First | Rest]) ->
    io:fwrite("Hello " ++ First ++ "\n"),
    greet(Rest).
