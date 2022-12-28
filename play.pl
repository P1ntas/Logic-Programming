% define the game loop
game(Board, Player, NumMoves) :-
    stones(Player, NumStones),
    NumStones >= NumMoves,
    select_stones(Board, Player, NumMoves, Stones),
    move_stones(Board, Stones, NewBoard),
    display_board(NewBoard),
    (
        win_condition(NewBoard, Player) ->
        format("Player ~w wins!", [Player]);
        (
            no_moves(NewBoard, OtherPlayer) ->
            format("Player ~w wins!", [OtherPlayer]);
            (
                other_player(Player, OtherPlayer),
                game(NewBoard, OtherPlayer, 3)
            )
        )
    ).

% define the function that selects N elements from a list
select_n(0, _, []) :- !.
select_n(N, List, [E|Rest]) :-
    N > 0,
    N1 is N-1,
    select_n(E, List, NewList),
    select_n(N1, NewList, Rest).

% define the function that returns the other player
other_player(w, b).
other_player(b, w).