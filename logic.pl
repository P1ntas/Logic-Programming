% define the initial number of stones for each player
stones(w, 12).
stones(b, 12).

% define the direction vectors for each player
dir(w, 1, 0).
dir(b, -1, 0).

% define the win condition for each player
win(w, 0).
win(b, 8).

% define the function that returns the other player
other_player(+, o).
other_player(o, +).

% define the possible movements for a given stone
direction(0, [X,Y], [X1,Y1]) :- X1 is X+3, Y1 is Y.
direction(1, [X,Y], [X1,Y1]) :- X1 is X-1, Y1 is Y.
direction(2, [X,Y], [X1,Y1]) :- X1 is X+2, Y1 is Y+1.
direction(3, [X,Y], [X1,Y1]) :- X1 is X, Y1 is Y+1.
direction(4, [X,Y], [X1,Y1]) :- X1 is X+2, Y1 is Y-1.
direction(5, [X,Y], [X1,Y1]) :- X1 is X, Y1 is Y-1.

% define the function that selects the stones to move
select_stones(Board, Player, X1, Y1, X2, Y2, X3, Y3) :-
    write('Choosing the coordinates for your first piece: \n\n'),
    read_input(19, 10, X1, Y1),
    check_coord(Board, Player, X1, Y1),
    write('Choosing the coordinates for your second piece: \n\n'),
    read_input(19, 10, X2, Y2),
    check_coord(Board, Player, X2, Y2),
    coordinates_not_same(Board, Player, X1, Y1, X2, Y2),
    write('Choosing the coordinates for your third piece: \n\n'),
    read_input(19, 10, X3, Y3),
    check_coord(Board, Player, X3, Y3),
    coordinates_not_same(Board, Player, X1, Y1, X3, Y3),
    coordinates_not_same(Board, Player, X2, Y2, X3, Y3).

% checks if these coordinates are valid
check_coord(Board, Player, X, Y) :-
    traverse_matrix(Board, X, Y, Player), !.

check_coord(Board, Player, X, Y) :-
    format('Invalid coordinates! You must select your own pieces: "~w" \n\n', Player),
    read_input(19, 10, X, Y),
    check_coord(Board, Player, X, Y).

traverse_matrix(Matrix, X, Y, Char) :-
    nth0(Y, Matrix, Row),
    nth0(X, Row, Element),
    Element == Char.

coordinates_not_same(_, _, X1, Y1, X2, Y2) :-
  X1 \= X2;
  Y1 \= Y2.

coordinates_not_same(Board, Player, X1, Y1, X2, Y2) :-
    write('You already chose that piece! Select a different one \n\n'),
    read_input(19, 10, X2, Y2),
    check_coord(Board, Player, X2, Y2),
    coordinates_not_same(X1, Y1, X2, Y2).


 select_dir(Board, Option, Player, X1, Y1, X2, Y2, X3, Y3) :-
    chooseDirection,
    read_number(0, 5, Option),
    check_dir(Board, Option, Player, X1, Y1, X2, Y2, X3, Y3).

check_dir(Board, Option, Player, X1, Y1, X2, Y2, X3, Y3) :-
    direction(Option, [X1, Y1], [X1_2, Y1_2]),
        (
            traverse_matrix(Board, X1_2, Y1_2, '_');
            traverse_matrix(Board, X1_2, Y1_2, other_player(Player))
        ),
    direction(Option, [X2, Y2], [X2_2, Y2_2]),
        (
            traverse_matrix(Board, X2_2, Y2_2, '_');
            traverse_matrix(Board, X2_2, Y2_2, other_player(Player))
        ),
    direction(Option, [X3, Y3], [X3_2, Y3_2]),
        (
            traverse_matrix(Board, X3_2, Y3_2, '_');
            traverse_matrix(Board, X3_2, Y3_2, other_player(Player))
        ).


check_dir(Board, Option, Player, X1, Y1, X2, Y2, X3, Y3) :-
    write('Invalid direction! Make sure all stones can move\n\n'),
    select_dir(Board, Option, Player, X1, Y1, X2, Y2, X3, Y3),
    check_dir(Board, Option, Player, X1, Y1, X2, Y2, X3, Y3).

move_stones(Board, Player, Direction, X1, Y1, X2, Y2, X3, Y3, NewBoard5) :-
    direction(Direction, [X1, Y1], [X1_2, Y1_2]),
    movepiece1(Board, X1, Y1, NewBoard),
    movepiece2(NewBoard, Player, X1_2, Y1_2, NewBoard1),
    direction(Direction, [X2, Y2], [X2_2, Y2_2]),
    movepiece1(NewBoard1, X2, Y2, NewBoard2),
    movepiece2(NewBoard2, Player, X2_2, Y2_2, NewBoard3),
    direction(Direction, [X3, Y3], [X3_2, Y3_2]),
    movepiece1(NewBoard3, X3, Y3, NewBoard4),
    movepiece2(NewBoard4, Player, X3_2, Y3_2, NewBoard5),
    print_board(NewBoard5).


movepiece1(Board, X1, Y1, NewBoard) :-
    nth0(Y1, Board, Row),
    inserto('_', Row, NewRow, X1),
    replace(Board, Y1, NewRow, NewBoard).

movepiece2(Board, Player, X1, Y1, NewBoard) :-
    nth0(Y1, Board, Row),
    inserto(Player, Row, NewRow, X1),
    replace(Board, Y1, NewRow, NewBoard).

replace([_|Tail], 0, Element, [Element|Tail]).
replace([Head|Tail], Index, Element, [Head|Result]) :-
    Index > 0,
    NewIndex is Index-1,
    replace(Tail, NewIndex, Element, Result).

inserto(_,[],[],_).
inserto(E,[_|Xs],[E|Ys],1) :- inserto(E,Xs,Ys,0),!.
inserto(E,[X|Xs],[X|Ys],N) :- N1 is N-1, inserto(E,Xs,Ys,N1).


% define the function that checks if a player has reached the opponents home row or has eaten all enemy stones
win_condition(Board, Player) :-
    other_player(Player, OtherPlayer),
        \+ (
            member(Row, Board),
            member(OtherPlayer, Row)
        );
        (
            nth0(1, Board, Row),
            member('+', Row)
        );
        (
            nth0(9, Board, Row),
            member('o', Row)
        ).
