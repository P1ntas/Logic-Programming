% Handle main menu input
handle_input(1):- play_menu, read_number(1, 3, Input), handle_play_input(Input).
handle_input(2):- display_rules.
handle_input(3):- exit.

%exits the game
exit:-
    abort.

% Handle play menu input
handle_play_input(1):- play_pvp.
handle_play_input(2):- difficulty_menu, read_number(1, 2, Input), 
handle_play_input(3):- difficulty_menu('(Bot 1)'), read_number(1, 2, Input1), difficulty_menu('(Bot 2)'), read_number(1, 2, Input2)


play_pvp:-
    game(Board, w).


% define the game loop
game(GameState, Player) :-
    print_board(GameState),
    select_stones(GameState, Player, X1, Y1, X2, Y2, X3, Y3),
    select_dir(Option),
    move_stones(GameState, Option, X1, Y1, X2, Y2, X3, Y3, NewBoard),
    print_board(NewBoard),
    (
        win_condition(NewBoard, Player) ->
        format("Player ~w wins!", [Player]);
        (
            other_player(Player, OtherPlayer),
            game(NewBoard, OtherPlayer, 3)
            
        )
    ).

/*
% define the function that selects N elements from a list
select_n(0, _, []) :- !.
select_n(N, List, [E|Rest]) :-
    N > 0,
    N1 is N-1,
    select_n(E, List, NewList),
    select_n(N1, NewList, Rest).
*/

% define the function that returns the other player
other_player(w, b).
other_player(b, w).