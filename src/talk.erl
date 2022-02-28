-module(talk).

-export([alice/0, bob/2, run/0, start_alice/0, start_bob/1]).

% Create an alice function to recieve a message from bob
alice() ->
    receive
        {message, BobNode} ->
            io:fwrite("Alice got a message.\n"),
            BobNode ! message,
            alice();
        finished -> io:fwrite("Alice is finished\n")
    end.
    
% ! means send a message. Bob sends a message to alice until there
% are no more messages to send.
bob(0, AliceNode) ->
    {alice, AliceNode} ! finished,
    io:fwrite("Bob is finished\n");
bob(N, AliceNode) ->
    {alice, AliceNode} ! {message, self()},
    receive
        message -> io:fwrite("Bob got a message\n")
    end,
    bob(N-1, AliceNode).

% Run the conversation between bob and alice by spawning two processes
run() ->
    register(alice, spawn(talk, alice, [])),
    register(bob, spawn(talk, bob, [3])).

start_alice() ->
    register(alice, spawn(talk, alice, [])).

start_bob(AliceNode) ->
    % we do not need to register this process because we have the Alcie node
    spawn(talk, bob, [3, AliceNode]).
