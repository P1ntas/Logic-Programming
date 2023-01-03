select_stones_bot_random(Board, Player, X1, Y1, X2, Y2, X3, Y3):-
    get_coords_bot_random(Board, Player, X1, Y1, X2, Y2, X3, Y3).


get_coords_bot_random(Board, Player, X1, Y1, X2, Y2, X3, Y3) :-
    repeat,
        write('Im here'),
        get_valid_coordinates_bot_random(Board, Player, X1, Y1),
        get_valid_coordinates_bot_random(Board, Player, X2, Y2),
        write('Im here 1'),
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
    choose_random_number(0, 18, X),
    choose_random_number(0, 9, Y),
    check_coord(Board, Player, X, Y), !.

get_valid_coordinates_bot_random(Board, Player, X, Y) :-
    get_valid_coordinates_bot_random(Board, Player, X, Y).


select_dir_bot_random(Board, Option, Player, Flag, List, X1, Y1, X2, Y2, X3, Y3):-
    repeat,
    write('Direction \n'),
    %(List == [] -> game_bot(Board, Player, Flag)),
    choose_random_number_from_list(List, Option),
    format(' ~d \n', Option),
    check_dir_bot_random(Board, Option, Player, List, X1, Y1, X2, Y2, X3, Y3),
    !.

check_dir_bot_random(Board, Option, Player, _, X1, Y1, X2, Y2, X3, Y3) :-
    write('Direction11111\n'),
    direction(Option, [X1, Y1], [X1_2, Y1_2], Board, Player, _),
        (
            traverse_matrix(Board, X1_2, Y1_2, '_');
            traverse_matrix(Board, X1_2, Y1_2, other_player(Player));
            (X1_2 == X2, Y1_2 == Y2); (X1_2 == X3, Y1_2 == Y3)
        ),
    direction(Option, [X2, Y2], [X2_2, Y2_2], Board, Player, _),
        (
            traverse_matrix(Board, X2_2, Y2_2, '_');
            traverse_matrix(Board, X2_2, Y2_2, other_player(Player));
            (X2_2 == X1, Y2_2 == Y1); (X2_2 == X3, Y2_2 == Y3)
        ),
    direction(Option, [X3, Y3], [X3_2, Y3_2], Board, Player, _),
        (
            traverse_matrix(Board, X3_2, Y3_2, '_');
            traverse_matrix(Board, X3_2, Y3_2, other_player(Player));
            (X3_2 == X1, Y3_2 == Y1); (X3_2 == X2, Y3_2 == Y2)
        ).

check_dir_bot_random(_, Option, _, List, _, _, _, _, _, _) :-
    remove_from_list(Option, List, Result),
    false.


