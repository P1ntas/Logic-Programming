% Handle main menu input
handle_input(1):- play_menu, read_number(1, 3, Input), handle_play_input(Input).
handle_input(2):- display_rules.
handle_input(3):- exit.

%exits the game
exit:-
    abort.

% Handle play menu input
handle_play_input(1):- play_pvp.
handle_play_input(2):- difficulty_menu, read_number(1, 2, Input).
handle_play_input(3):- difficulty_menu('(Bot 1)'), read_number(1, 2, Input1), difficulty_menu('(Bot 2)'), read_number(1, 2, Input2).


play_pvp:-
    print_Initboard(Board),
    game(Board, '+').


% define the game loop
game(GameState, Player) :-
    select_stones(GameState, Player, X1, Y1, X2, Y2, X3, Y3),
    select_dir(GameState, Option, Player, X1, Y1, X2, Y2, X3, Y3),
    move_stones(GameState, Player, Option, X1, Y1, X2, Y2, X3, Y3, NewBoard),
    print_board(NewBoard),
    (
        win_condition(NewBoard, Player) ->
        format('Player ~w wins! \n\n', [Player]);
        (
            other_player(Player, OtherPlayer),
            format('\n\nNow is the player "~w" turn\n\n', OtherPlayer),
            game(NewBoard, OtherPlayer)
            
        )
    ).

