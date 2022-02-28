-module(cal).

%% API
-export([leap/1, days/2]).

%% Return leap year or non leap year using an if/else
leap(Year) -> 
    if 
        Year rem 400 == 0 -> leap;
        Year rem 100 == 0 -> non_leap;
        Year rem 4 == 0 -> leap;
        true -> non_leap
    end.

% Use case to determine the number of days in each month. month is an atom.
days(Month, Year) -> 
    Leap = leap(Year),
    case Month of
        jan -> 31;
        %% this is a guard. feb applies only when true is in the expression
        feb when Leap == leap -> 29;
        feb -> 28;
        mar -> 31;
        apr -> 30;
        may -> 31;
        jun -> 30;
        jul -> 31;
        aug -> 31;
        sept -> 30;
        oct -> 31;
        nov -> 30;
        dec -> 31
    end.
