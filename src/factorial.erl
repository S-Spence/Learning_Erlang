-module(factorial).

%% API
-export([factorial/1]).

%% multi-clause function. Note: The N must be capital when passing as an arg
factorial(1) ->
    1;
factorial(N) ->
    N * factorial(N-1).
