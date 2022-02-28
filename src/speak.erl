-module(speak).

-export([say/2, run/0]).

% done is a keyword in erlang to know when a process is done
say(What, 0) ->
    done;
say(What, Times) ->
    io:fwrite(What ++ "\n"),
    say(What, Times - 1).

% The spawn function creates a new process to access a module that only call
% functions that are exported. You must export both functions. 
% Spawn will run processes in paralell.
run() -> 
    spawn(speak, say, ["Hello", 3]),
    spawn(speak, say, ["Bye", 3]).
