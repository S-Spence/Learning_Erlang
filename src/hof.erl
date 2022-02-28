-module(hof).

% API
-export([double/0]).

% Create a higher order function to double a number
double() ->
    % Create a higher order function (assign te function to a variable)
    F = fun(X) -> 2 * X end,
    % double each element in the list
    map(F, [1, 2, 3, 4, 5]).

% Notice how the local variable within double is accessible to other functions.
map(F, []) ->
    [];
map(F, [First | Rest]) ->
    [F(First) | map(F, Rest)].
