% define the board

init_board([
['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8'],
['1', ' ', ' ', ' ', '|', 'o', '|', 'o', '|', 'o', '|', 'o', '|', 'o', '|', ' ', ' ', ' ', ' '],
['2', ' ', ' ', '|', '_', '|', 'o', '|', 'o', '|', 'o', '|', 'o', '|', '_', '|', ' ', ' ', ' '],
['3', ' ', '|', '_', '|', '_', '|', 'o', '|', 'o', '|', 'o', '|', '_', '|', '_', '|', ' ', ' '],
['4', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', ' '],
['5', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|'],
['6', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', '_', '|', ' '],
['7', ' ', '|', '_', '|', '_', '|', '+', '|', '+', '|', '+', '|', '_', '|', '_', '|', ' ', ' '],
['8', ' ', ' ', '|', '_', '|', '+', '|', '+', '|', '+', '|', '+', '|', '_', '|', ' ', ' ', ' '],
['9', ' ', ' ', ' ', '|', '+', '|', '+', '|', '+', '|', '+', '|', '+', '|', ' ', ' ', ' ', ' ']
]).


print_Initboard(Board) :-
    init_board(Board),
    maplist(print_row, Board).

print_board(Board) :-
    maplist(print_row, Board).

print_row(Row) :-
    maplist(format("~w "), Row),
    nl.


display_menu:-
    write(' ____________________________________________________________________________'), nl,
    write('|                                                                            |'), nl,
    write('|                                                                            |'), nl,
    write('|                                                                            |'), nl,
    write('|          _______ _______ _______ _______ _______ _______ _______           |'), nl,
    write('|         |       |       |       |       |       |       |       |          |'), nl,
    write('|         |_     _|   _   |   _   |       |   _   |       |   _   |          |'), nl,
    write('|           |   | |  |_|  |  |_|  |      _|  | |  |      _|  |_|  |          |'), nl,
    write('|           |   | |       |       |     | |  |_|  |     | |       |          |'), nl,
    write('|           |   | |   _   |   _   |     |_|       |     |_|   _   |          |'), nl,
    write('|           |___| |__| |__|__| |__|_______|_______|_______|__| |__|          |'), nl,
    write('|                                                                            |'), nl,
    write('|                                                                            |'), nl,
    write('|                                                                            |'), nl,
    write('|                                 1. Play                                    |'), nl,
    write('|                                 2. Rules                                   |'), nl,
    write('|                                 3. Exit                                    |'), nl,
    write('|                                                                            |'), nl,
    write('|                                                                            |'), nl,
    write('|____________________________________________________________________________|'), nl.
/*


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
    write(' ____________________________________________________________________________'), nl,
    write('|                                                                            |'), nl,
    write('|                     ~~~~~~ RULES OF TAACOCA ~~~~~~                         |'), nl,
    write('|                                                                            |'), nl,
    write('|       - Your objective is to reach the home row of the opponent.           |'), nl,
    write('|                                                                            |'), nl,
    write('|       - You can also win if your opponent is left without any stone        |'), nl,
    write('|           or without any moves.                                            |'), nl,
    write('|                                                                            |'), nl,
    write('|       - Game begins with a move from the White player.                     |'), nl,
    write('|                                                                            |'), nl,
    write('|       - After that, players take turns moving any three of their           |'), nl,
    write('|           stones one cell forward in the same direction.                   |'), nl,
    write('|                                                                            |'), nl,
    write('|       - If a player has less than three stones he must move                |'), nl,
    write('|           all the remaining stones.                                        |'), nl,
    write('|                                                                            |'), nl,
    write('|       - If that cant be done, that player loses the game.                  |'), nl,
    write('|                                                                            |'), nl,
    write('|       - The stones moved dont need to be connected to each other,          |'), nl,
    write('|           they just have to move in the same direction.                    |'), nl,
    write('|                                                                            |'), nl,
    write('|       - If some or all the targeted cells are occupied by a stone          |'), nl,
    write('|           from the opponent, those stones are captured and removed         |'), nl,
    write('|           from the board.                                                  |'), nl,
    write('|____________________________________________________________________________|'), nl,
    display_menu.

chooseDirection:-
    write(' ----- Piece Directions -----\n\n'),
    write('|        0. Right             |\n'),
    write('|        1. Left              |\n'),
    write('|        2. Down Right        |\n'),
    write('|        3. Down Left         |\n'),
    write('|        4. Up Right          |\n'),
    write('|        5. Up Left           |\n\n').