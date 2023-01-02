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
direction(0, [X,Y], [X1,Y1]) :- X1 is X+2, Y1 is Y.
direction(1, [X,Y], [X1,Y1]) :- X1 is X-2, Y1 is Y.
direction(2, [X,Y], [X1,Y1]) :- X1 is X+1, Y1 is Y+1.
direction(3, [X,Y], [X1,Y1]) :- X1 is X-1, Y1 is Y+1.
direction(4, [X,Y], [X1,Y1]) :- X1 is X+1, Y1 is Y-1.
direction(5, [X,Y], [X1,Y1]) :- X1 is X-1, Y1 is Y-1.

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

move_stones(Board, Direction, X1, Y1, X2, Y2, X3, Y3, NewBoard2) :-
    direction(Direction, [X1, Y1], [X1_2, Y1_2]),
    movepiece(Board, X1, Y1, X1_2, Y1_2, NewBoard),
    direction(Direction, [X2, Y2], [X2_2, Y2_2]),
    movepiece(NewBoard, X2, Y2, X2_2, Y2_2, NewBoard1),
    direction(Direction, [X3, Y3], [X3_2, Y3_2]),
    movepiece(NewBoard1, X3, Y3, X3_2, Y3_2, NewBoard2).


movepiece(Board, X1, Y1, X2, Y2, NewBoard) :-
    selectch(Board, X1, Y1, Ch),
    deletech(Board, X1, Y1, Board1),
    insertch(Board1, X2, Y2, Ch, Board2),
    insertch(Board2, X1, Y1, '_', NewBoard).


selectch([Row|Rows], 0, Y, Ch) :-
    selectch_row(Row, Y, Ch).

selectch([_|Rows], X, Y, Ch) :-
    X > 0,
    X1 is X - 1,
    selectch(Rows, X1, Y, Ch).

selectch_row([Ch|_], 0, Ch).

selectch_row([_|Cols], Y, Ch) :-
    Y > 0,
    Y1 is Y - 1,
    selectch_row(Cols, Y1, Ch).

deletech(Board, X, Y, NewBoard) :-
    selectch(Board, X, Y, Ch),
    deletech(Board, X, Y, Ch, NewBoard).

deletech([Row|Rows], 0, Y, Ch, [NewRow|Rows]) :-
    deletech_row(Row, Y, Ch, NewRow).

deletech([Row|Rows], X, Y, Ch, [Row|NewRows]) :-
    X > 0,
    X1 is X - 1,
    deletech(Rows, X1, Y, Ch, NewRows).

deletech_row([_|Cols], 0, _, Cols).

deletech_row([Ch|Cols], Y, Ch, [_|Cols]) :-
    Y > 0,
    Y1 is Y - 1,
    deletech_row(Cols, Y1, Ch, Cols).


insertch(Board, X, Y, Ch, NewBoard) :-
    deletech(Board, X, Y, NewBoard1),
    insertch(NewBoard1, X, Y, Ch, NewBoard).

insertch([Row|Rows], 0, Y, Ch, [NewRow|Rows]) :-
    insertch_row(Row, Y, Ch, NewRow).

insertch([Row|Rows], X, Y, Ch, [Row|NewRows]) :-
    X > 0,
    X1 is X - 1,
    insertch(Rows, X1, Y, Ch, NewRows).

insertch_row([_|Cols], 0, Ch, [Ch|Cols]).

insertch_row([Ch|Cols], Y, Ch, [Ch|NewCols]) :-
    Y > 0,
    Y1 is Y - 1,
    insertch_row(Cols, Y1, Ch, NewCols).



/*
movepiece(Board, FromX, FromY, ToX, ToY, NewBoard) :-
  nth0(FromY, Board, Row),
  nth0(FromX, Row, Piece),
  delete(Row, Piece, NewRow),
  insert(NewRow, '_', FromX),
  delete(Board, Row, IntermediateBoard),
  nth0(ToY, IntermediateBoard, ToRow),
  delete(IntermediateBoard, ToRow, IntermediateBoard2),
  insert(ToRow, Piece, NewToRow),
  insert(IntermediateBoard2, NewToRow, NewIntermediateBoard),
  nth0(FromY, NewIntermediateBoard, NewFromRow),
  insert(NewIntermediateBoard, NewFromRow, NewBoard).
*/



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