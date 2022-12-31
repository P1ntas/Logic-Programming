% define the initial number of stones for each player
stones(w, 12).
stones(b, 12).

% define the direction vectors for each player
dir(w, 1, 0).
dir(b, -1, 0).

% define the win condition for each player
win(w, 0).
win(b, 8).

% define the possible movements for a given stone
move([X,Y], [X1,Y1]) :- X1 is X+1, Y1 is Y.
move([X,Y], [X1,Y1]) :- X1 is X-1, Y1 is Y.
move([X,Y], [X1,Y1]) :- X1 is X, Y1 is Y+1.
move([X,Y], [X1,Y1]) :- X1 is X, Y1 is Y-1.
move([X,Y], [X1,Y1]) :- X1 is X-1, Y1 is Y+1.
move([X,Y], [X1,Y1]) :- X1 is X+1, Y1 is Y-1.
move([X,Y], [X1,Y1]) :- X1 is X+1, Y1 is Y+1.
move([X,Y], [X1,Y1]) :- X1 is X-1, Y1 is Y-1.

% define the function that selects the stones to move
select_stones(Board, Player, X1, Y1, X2, Y2, X3, Y3) :-
    read_input(19, 10, X1, Y2),
    check_coord(X, Y),
    read_input(19, 10, X2, Y2),
    check_coord(X1, Y2),
    read_input(19, 10, X3, Y3),
    check_coord(X3, Y3).

% define the function that moves the selected stones
move_stones(Board, Stones, NewBoard) :-
    maplist(update_board(Board, Stones), NewBoard).

% define the function that updates a single cell of the board
update_board(Board, Stones, NewValue, [X,Y]) :-
    nth1(X, Board, Row),
    nth1(Y, Row, Value),
    (
        member([X,Y], Stones) ->
        stones(Player, _),
        dir(Player, DX, DY),
        NewX is X+DX,
        NewY is Y+DY,
        (
            cell_empty(Board, NewX, NewY) ->
            NewValue = Player;
            NewValue = Value
        );
        NewValue = Value
    ).


% define the function that checks if a cell is empty
cell_empty(Board, X, Y) :-
    nth1(X, Board, Row),
    nth1(Y, Row, Value),
    Value = _.

% define the function that checks if a player has no more moves
no_moves(Board, Player) :-
    findall(Stone, (member(Row, Board), member(Player, Row), Stone = [X,Y]), AllStones),
    forall(member(Stone, AllStones), \+move(Stone, _)).

% define the function that checks if a player has reached the opponents home row
win_condition(Board, Player) :-
    win(Player, WinRow),
    findall(X, (member([X,_], Board), member(Player, [X,_])), Rows),
    member(WinRow, Rows).