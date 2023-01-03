% Handle main menu input
handle_input(1):- play_menu, read_number(1, 3, Input), handle_play_input(Input).
handle_input(2):- display_rules.
handle_input(3):- exit.

%exits the game
exit:-
    abort.

% Handle play menu input
handle_play_input(1):- play_pvp.
handle_play_input(2):- difficulty_menu, read_number(1, 2, Input), play_pvc.
handle_play_input(3):- difficulty_menu('(Bot 1)'), read_number(1, 2, Input1), difficulty_menu('(Bot 2)'), read_number(1, 2, Input2).


play_pvp:-
    print_Initboard(Board),
    game_pvp(Board, '+').

play_pvc:-
    print_Initboard(Board),
    game_pvc(Board, '+').

% define the game loop
game_pvp(GameState, Player) :-
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

game_pvc(GameState, Player) :-
    select_stones(GameState, Player, X1, Y1, X2, Y2, X3, Y3),
    select_dir(GameState, Option, Player, X1, Y1, X2, Y2, X3, Y3),
    move_stones(GameState, Player, Option, X1, Y1, X2, Y2, X3, Y3, NewBoard),
    print_board(NewBoard),
    (
        win_condition(NewBoard, Player) ->
        format('\n\nPlayer ~w wins! \n\n', [Player]);
        (
            other_player(Player, OtherPlayer),
            format('\n\nNow is the player "~w" turn\n\n', OtherPlayer),
            game_bot(NewBoard, OtherPlayer)
        )
    ).

game_bot(Board, Player):-
    select_stones_bot_random(GameState, Player, X1, Y1, X2, Y2, X3, Y3),
    select_dir_bot_random(GameState, Option, Player, X1, Y1, X2, Y2, X3, Y3),
    move_stones_bot_random(GameState, Player, Option, X1, Y1, X2, Y2, X3, Y3, NewBoard),
    print_board(NewBoard),
    (
        win_condition(NewBoard, Player) ->
        format('\n\nPlayer ~w wins! \n\n', [Player]);
        (
            other_player(Player, OtherPlayer),
            format('\n\nNow is the player "~w" turn\n\n', OtherPlayer),
            game_pvc(NewBoard, OtherPlayer)
        )
    ).