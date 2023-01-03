% Handle main menu input
handle_input(1):- play_menu, read_number(1, 3, Input), handle_play_input(Input).
handle_input(2):- display_rules.
handle_input(3):- exit.

%exits the game
exit:-
    abort.

% Handle play menu input
handle_play_input(1):- play_pvp(0).
handle_play_input(2):- play_pvc(1).
handle_play_input(3):- play_cvc(2).


play_pvp(Flag):-
    print_Initboard(Board),
    game_pvp(Board, '+', Flag).

play_pvc(Flag):-
    print_Initboard(Board),
    game_pvc(Board, '+', Flag).

play_cvc(Flag):-
    print_Initboard(Board),
    game_cvc(Board, '+', Flag).


% define the game loop
game_pvp(GameState, Player, Flag) :-
    select_stones(GameState, Player, X1, Y1, X2, Y2, X3, Y3),
    select_dir(GameState, Option, Player, Flag, X1, Y1, X2, Y2, X3, Y3),
    move_stones(GameState, Player, Option, X1, Y1, X2, Y2, X3, Y3, NewBoard),
    nl, nl, display_game(NewBoard),
    (
        game_over(NewBoard, Player) ->
        format('->Player ~w wins! \n\n', [Player]), play, !;
        (
            other_player(Player, OtherPlayer),
            format('\n\n->Now is the player "~w" turn\n\n', OtherPlayer),
            game_pvp(NewBoard, OtherPlayer, Flag)
        )
    ).

game_pvc(GameState, Player, Flag) :-
    select_stones(GameState, Player, X1, Y1, X2, Y2, X3, Y3),
    select_dir(GameState, Option, Player, Flag, X1, Y1, X2, Y2, X3, Y3),
    move_stones(GameState, Player, Option, X1, Y1, X2, Y2, X3, Y3, NewBoard),
    nl, nl, display_game(NewBoard),
    (
        game_over(NewBoard, Player) ->
        format('\n\nPlayer ~w wins! \n\n', [Player]), play, !;
        (
            other_player(Player, OtherPlayer),
            format('\n\n->Now is the player "~w" turn\n\n', OtherPlayer),
            game_bot(NewBoard, OtherPlayer, Flag)
        )
    ).

game_cvc(GameState, Player, Flag):-
    sleep(1),
    list2(List),
    select_stones_bot_random(GameState, Player, X1, Y1, X2, Y2, X3, Y3),
    select_dir_bot_random(GameState, Option, Player, Flag, List, X1, Y1, X2, Y2, X3, Y3),
    move_stones(GameState, Player, Option, X1, Y1, X2, Y2, X3, Y3, NewBoard),
    nl, nl, display_game(NewBoard),
    (
        game_over(NewBoard, Player) ->
        format('\n\n->Player ~w wins! \n\n', [Player]), play, !;
        (
            other_player(Player, OtherPlayer),
            format('\n\n->Now is the player "~w" turn\n\n', OtherPlayer),
            game_cvc(NewBoard, OtherPlayer, Flag)
        )
    ).


game_bot(GameState, Player, Flag):-
    sleep(1),
    list1(List),
    select_stones_bot_random(GameState, Player, X1, Y1, X2, Y2, X3, Y3),
    select_dir_bot_random(GameState, Option, Player, Flag, List, X1, Y1, X2, Y2, X3, Y3),
    move_stones(GameState, Player, Option, X1, Y1, X2, Y2, X3, Y3, NewBoard),
    nl, nl, display_game(NewBoard),
    (
        game_over(NewBoard, Player) ->
        format('\n\n->Player ~w wins! \n\n', [Player]), play, !;
        (
            other_player(Player, OtherPlayer),
            format('\n\n->Now is the player "~w" turn\n\n', OtherPlayer),
            game_pvc(NewBoard, OtherPlayer, Flag)
        )
    ).
