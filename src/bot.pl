% Selects random coordinates
select_stones_bot_random(Board, Player, X1, Y1, X2, Y2, X3, Y3):-
    get_coords_bot_random(Board, Player, X1, Y1, X2, Y2, X3, Y3).

% Gets random coordinates
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

% Gets random coordinates and checks if it's random
get_valid_coordinates_bot_random(Board, Player, X, Y) :-
    choose_random_number(0, 18, X),
    choose_random_number(0, 9, Y),
    check_coord(Board, Player, X, Y), !.

% Gets random coordinates and checks if it's random
get_valid_coordinates_bot_random(Board, Player, X, Y) :-
    get_valid_coordinates_bot_random(Board, Player, X, Y).

% Selects random direction to move
select_dir_bot_random(Board, Option, Player, Flag, List, X1, Y1, X2, Y2, X3, Y3):-
    repeat,
    choose_random_number_from_list(List, Option),
    check_dir_bot_random(Board, Option, Player, Flag, List, X1, Y1, X2, Y2, X3, Y3),
    !.

% Check if direction is possible
check_dir_bot_random(Board, Option, Player, Flag, _, X1, Y1, X2, Y2, X3, Y3) :-
    direction(Option, [X1, Y1], [X1_2, Y1_2], Board, Player, Flag),
    other_player(Player, OtherPlayer),
        (
            traverse_matrix(Board, X1_2, Y1_2, '_');
            traverse_matrix(Board, X1_2, Y1_2, OtherPlayer);
            (X1_2 == X2, Y1_2 == Y2); (X1_2 == X3, Y1_2 == Y3)
        ),
    direction(Option, [X2, Y2], [X2_2, Y2_2], Board, Player, Flag),
        (
            traverse_matrix(Board, X2_2, Y2_2, '_');
            traverse_matrix(Board, X2_2, Y2_2, OtherPlayer);
            (X2_2 == X1, Y2_2 == Y1); (X2_2 == X3, Y2_2 == Y3)
        ),
    direction(Option, [X3, Y3], [X3_2, Y3_2], Board, Player, Flag),
        (
            traverse_matrix(Board, X3_2, Y3_2, '_');
            traverse_matrix(Board, X3_2, Y3_2, OtherPlayer);
            (X3_2 == X1, Y3_2 == Y1); (X3_2 == X2, Y3_2 == Y2)
        ).

% Check if direction is possible
check_dir_bot_random(_, _, _, _, _, _, _, _, _, _, _) :-
    false.


