% define the board
board([[w,w,w,w,w],
       [e,w,w,w,w,e],
       [e,e,w,w,w,e,e],
       [e,e,e,e,e,e,e,e],
       [e,e,e,e,e,e,e,e,e],
       [e,e,e,e,e,e,e,e],
       [e,e,b,b,b,e,e],
       [e,b,b,b,b,e],
       [b,b,b,b,b]]).


% Prints the board on the terminal.
print_board(Board) :-
    print_board(Board, 1).

% Recursive helper for print_board/1.
%printboard([], ).
print_board([Row|Rows], RowNum) :-
    print_row(Row, RowNum),
    RowNum2 is RowNum + 1,
    print_board(Rows, RowNum2).

% Prints a row of the board on the terminal.
print_row(Row, RowNum) :-
    (   RowNum mod 2 =:= 1
    ->  Offset = '   '
    ;   Offset = ' '
    ),
    write(Offset),
    print_cells(Row),
    nl.

print_cells([]).
print_cells([Cell|Cells]) :-
    (   Cell = b
    ->  write(' b ')
    ;   Cell = w
    ->  write(' w ')
    ;   Cell = e
    ->  write(' e ')
    ),
    print_cells(Cells).

/*
mainMenu1:-
    write('\n\n ____________________________________________________________________________\n'),
    write('|                                                                            |\n'),                                                                      
    write('|                                                                            |\n'),
    write('|                                                                            |\n'),
    write('|                                                                            |\n'),
    write('|                                                                            |\n'),
    write('|                                                                            |\n'),
    write('|                                                                            |\n'),
    write('|                                                                            |\n'),
    write('|                                                                            |\n'),
    write('|                                                                            |\n'),
    write('|                                                                            |\n'),
    write('|                                                                            |\n'),
    write('|                           1. Player vs Player                              |\n'),
    write('|                           2. Player vs Computer                            |\n'),
    write('|                           3. Computer vs Player                            |\n'),
    write('|                           4. Computer vs Computer                          |\n'),
    write('|                                                                            |\n'),
    write('|                           0. Exit                                          |\n'),
    write('|                                                                            |\n'),
    write('|____________________________________________________________________________|\n').

% Prints the Selection of the Bot Difficulty
botDiffs:-
    write('|        1. Easy         |\n'),
    write('|        2. Medium       |\n'),
    write('|        0. Exit         |\n').

header(RandomString):-
    format(' ---- ~w ----\n', [RandomString]).

bottom:-
    write('|________________________|\n').

empty:-
    write('|                        |\n').

chooseBotDiff:-
    header('Bot Difficulty'),
    empty,
    botDiffs,
    empty,
    bottom.

chooseBot1Diff:-
    header('Bot 1 Difficulty'),
    empty,
    botDiffs,
    empty,
    bottom.

chooseBot2Diff:-
    header('Bot 2 Difficulty'),
    empty,
    botDiffs,
    empty,
    bottom.
*/



% Main menu
display_menu:-
    write('Welcome to Taacooca!'), nl,
    write('1 - Play'), nl,
    write('2 - Rules'), nl,
    write('3 - Exit'), nl.

% Play menu
play_menu:-
    write('1 - Player vs Player'), nl,
    write('2 - Player vs Computer'), nl,
    write('3 - Computer vs Computer'), nl.

% Difficulty menu
difficulty_menu(GameMode):-
    write('Select difficulty:'), nl,
    write('1 - Easy'), nl,
    write('2 - Hard'), nl.

% Display rules
display_rules:-
    write('REGRAS...\nREGRAS...\n'), nl,
    display_menu.
