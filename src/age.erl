-module(age).

-export([get_age/1, get_type/1]).

%% Create maps with a # value before {}
get_age(Name) ->
    AgeMap = #{"Alice" => 23, "Bob" => 42, "Sam" => 43},
    maps:get(Name, AgeMap, -1).

%% Implement get age type with guards
get_type(N) when N < 13 ->
    child;
get_type(N) when N < 18 ->
    teenager;
get_type(N) when N >= 18 ->
    adult.
