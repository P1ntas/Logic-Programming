% define the board
board([
[' ',' ',' ',' ',' ','_','_','_','_','_','_','_','_','_',' ',' ',' ',' ',' '],
[' ',' ',' ',' ','|','o','|','o','|','o','|','o','|','o','|',' ',' ',' ',' '],
[' ',' ',' ','|','_','|','o','|','o','|','o','|','o','|','_','|',' ',' ',' '],
[' ',' ','|','_','|','_','|','o','|','o','|','o','|','_','|','_','|',' ',' '],
[' ','|','_','|','_','|','_','|','_','|','_','|','_','|','_','|','_','|',' '],
['|','_','|','_','|','_','|','_','|','_','|','_','|','_','|','_','|','_','|'],
[' ','|','_','|','_','|','_','|','_','|','_','|','_','|','_','|','_','|',' '],
[' ',' ','|','_','|','_','|','+','|','+','|','+','|','_','|','_','|',' ',' '],
[' ',' ',' ','|','_','|','+','|','+','|','+','|','+','|','_','|',' ',' ',' '],
[' ',' ',' ',' ','|','+','|','+','|','+','|','+','|','+','|',' ',' ',' ',' ']
]).


board(Board).

print_board(Board) :-
    board(Board),
    maplist(print_row, Board), true.


print_row(Row) :-
    maplist(format("~w "), Row),
    nl.


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
difficulty_menu(Bot):-
    format('Select difficulty ~w:', Bot), nl,
    write('1 - Easy'), nl,
    write('2 - Hard'), nl.

% Display rules
display_rules:-
    write('REGRAS...\nREGRAS...\n'), nl,
    display_menu.
