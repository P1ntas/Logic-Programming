select_stones_bot_random(GameState, Player, X1, Y1, X2, Y2, X3, Y3):-
    get_coords_bot_random(Board, Player, X1, Y1, X2, Y2, X3, Y3).


get_coords_bot_random(Board, Player, X1, Y1, X2, Y2, X3, Y3) :-
    repeat,
        get_valid_coordinates_bot_random(Board, Player, X1, Y1),
        get_valid_coordinates_bot_random(Board, Player, X2, Y2),
        (   X1 == X2, Y1 == Y2
        -> 
            fail
        ;   true
        ),
        get_valid_coordinates_bot_random(Board, Player, X3, Y3),
        (   ((X1 == X3, Y1 == Y3)
        ;   (X2 == X3, Y2 == Y3))
        -> 
            fail
        ;   true
        ),
        !.

get_valid_coordinates_bot_random(Board, Player, X, Y) :-
   %choose random for bot
    check_coord_bot_random(Board, Player, X, Y), !.

get_valid_coordinates_bot_random(Board, Player, X, Y) :-
    get_valid_coordinates_bot_random(Board, Player, X, Y).





select_dir_bot_random(GameState, Option, Player, X1, Y1, X2, Y2, X3, Y3):-




move_stones_bot_random(GameState, Player, Option, X1, Y1, X2, Y2, X3, Y3, NewBoard):-