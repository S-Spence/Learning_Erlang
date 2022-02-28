-module(temp).

%% API (Remember /x is always the number of arguments)
-export([convert/2, convert/1]).

%% F is a variable (Uppercase), fahrenheit is an atom (lowercase)
convert(F, fahrenheit) ->
    (F -32) * 5/9;
convert(C, celsius) ->
    C * 9/5 + 32.

%% use a tuple to make code more readable
%% separate code with commas
convert({fahrenheit, X}) ->
    Y = (X - 32) * 5/9,
    {celsius, Y};

convert({celsius, X}) -> 
    Y = X * 5/9 + 32,
    {fahrenheit, Y}.
