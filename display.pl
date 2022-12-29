% define the board
board([[b,b,b,b,b],
      [_,b,b,b,b,_],
     [_,_,b,b,b,_,_],
    [_,_,_,_,_,_,_,_],
   [_,_,_,_,_,_,_,_,_],
    [_,_,_,_,_,_,_,_],
     [_,_,w,w,w,_,_],
      [_,w,w,w,w,_],
       [w,w,w,w,w]]).


% define the function that displays the board
display_board(Board) :-
    maplist(writeln, Board).


% Prints Main Menu
mainMenu:-
    write('\n\n ____________________________________________________________________________\n'),
    write('|                                                                            |\n'),                                                                      
    write('|                                                                            |\n'),
    write('|                                                                            |\n'),
    write('|            ▄▄▄▄▄▄▄ ▄▄▄▄▄▄ ▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄            |\n'),
    write('|           █       █      █      █       █       █       █      █           |\n'),
    write('|           █▄     ▄█  ▄   █  ▄   █       █   ▄   █       █  ▄   █           |\n'),
    write('|             █   █ █ █▄█  █ █▄█  █     ▄▄█  █ █  █     ▄▄█ █▄█  █           |\n'),
    write('|             █   █ █      █      █    █  █  █▄█  █    █  █      █           |\n'),
    write('|             █   █ █  ▄   █  ▄   █    █▄▄█       █    █▄▄█  ▄   █           |\n'),
    write('|             █▄▄▄█ █▄█ █▄▄█▄█ █▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄█ █▄▄█           |\n'),
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
    format('---------- ~d ----------\n', [RandomString]).

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