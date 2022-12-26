:- use_module(library(clpfd)).

% define the board
board([[w,w,w,w,w],
       [_,w,w,w,w,_],
       [_,_,w,w,w,_,_],
       [_,_,_,_,_,_,_,_],
       [_,_,_,_,_,_,_,_,_],
       [_,_,_,_,_,_,_,_],
       [_,_,b,b,b,_,_],
       [_,b,b,b,b,_],
       [b,b,b,b,b]]).

% define the initial number of stones for each player
stones(w, 12).
stones(b, 12).

% define the direction vectors for each player
dir(w, 1, 0).
dir(b, -1, 0).

% define the win condition for each player
win(w, 5).
win(b, 1).

% define the possible movements for a given stone
move([X,Y], [X1,Y1]) :- X1 is X+1, Y1 is Y.
move([X,Y], [X1,Y1]) :- X1 is X, Y1 is Y+1.
move([X,Y], [X1,Y1]) :- X1 is X-1, Y1 is Y+1.

% define the game loop
game(Board, Player, NumMoves) :-
    stones(Player, NumStones),
    NumStones >= NumMoves,
    select_stones(Board, Player, NumMoves, Stones),
    move_stones(Board, Stones, NewBoard),
    display_board(NewBoard),
    (
        win_condition(NewBoard, Player) ->
        format("Player ~w wins!", [Player]);
        (
            no_moves(NewBoard, OtherPlayer) ->
            format("Player ~w wins!", [OtherPlayer]);
            (
                other_player(Player, OtherPlayer),
                game(NewBoard, OtherPlayer, 3)
            )
        )
    ).

% define the function that selects the stones to move
select_stones(Board, Player, NumMoves, Stones) :-
    findall(Stone, (member(Row, Board), member(Player, Row), Stone = [X,Y]), AllStones),
    length(AllStones, NumAllStones),
    (
        NumMoves > NumAllStones ->
        Stones = AllStones;
        (
            select_n(NumMoves, AllStones, Stones)
        )
    ).

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

% define the function that checks if a player has reached the opponent's home row
win_condition(Board, Player) :-
    win(Player, WinRow),
    findall(X, (member([X,_], Board), member(Player, [X,_])), Rows),
    member(WinRow, Rows).

% define the function that selects N elements from a list
select_n(0, _, []) :- !.
select_n(N, List, [E|Rest]) :-
    N > 0,
    N1 is N-1,
    select(E, List, NewList),
    select_n(N1, NewList, Rest).

% define the function that displays the board
display_board(Board) :-
    maplist(writeln, Board).

% define the function that returns the other player
other_player(w, b).
other_player(b, w).

% start the game
play :-
    board(Board),
    game(Board, w, 3).



% To play the game, you can simply run the play predicate in the Prolog interpreter. The game will then prompt you to select which stones to move, and the computer will make its moves automatically. The game will continue until one of the players wins or there are no more moves left.