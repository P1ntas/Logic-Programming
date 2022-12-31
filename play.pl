% Handle main menu input
handle_input(1):- play_menu.
handle_input(2):- display_rules.
handle_input(3):- exit.

exit:-
    abort.

% Handle play menu input
handle_play_input(1):- play_pvp.
handle_play_input(2):- difficulty_menu(player_vs_computer).
handle_play_input(3):- difficulty_menu(computer_vs_computer).


% Handle difficulty menu input
handle_difficulty_input(1, GameMode):- play(GameMode, easy).
handle_difficulty_input(2, GameMode):- play(GameMode, hard).


% Start game
play(pvp, _):- play_pvp.
play(player_vs_computer, Difficulty):- play_pvc(Difficulty).
play(computer_vs_computer, Difficulty):- play_cvc(Difficulty).



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