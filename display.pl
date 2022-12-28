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

/*
% Prints Main Menu
printMainMenu:-
    write('\n\n _______________________________________________________________________ \n'),
    write('|                                                                       |\n'),
    write('|                                                                       |\n'),
    write('|             ___   ____   ____   ____   _  _   ____   ____             |\n'),
    write('|            / __) (  _ \\ ( ___) ( ___) ( \\( ) ( ___) (  _ \\            |\n'),
    write('|           ( (_-.  )   /  )__)   )__)   )  (   )__)   )   /            |\n'),
    write('|            \\___/ (_)\\_) (____) (____) (_)\\_) (____) (_)\\_)            |\n'),
    write('|                                                                       |\n'),
    write('|                          1. Player vs Player                          |\n'),
    write('|                          2. Player vs Computer                        |\n'),
    write('|                          3. Computer vs Player                        |\n'),
    write('|                          4. Computer vs Computer                      |\n'),
    write('|                                                                       |\n'),
    write('|                          0. Exit                                      |\n'),
    write('|                                                                       |\n'),
    write('|                                                                       |\n'),
    write(' _______________________________________________________________________ \n').

% Prints the Selection of the Board Size
printBoards:-
    write('| 1.    6 x 6      |\n'),
    write('| 2.    6 x 9      |\n'),
    write('| 3.    9 x 9      |\n'),
    write('| 0.    Exit       |\n').
% Prints the Selection of the Bot Difficulty
printDifficulties:-
    write('| 1. Easy (Random)   |\n'),
    write('| 2. Medium (Greedy) |\n'),
    write('| 0.     Exit        |\n').
% Prints the Selected Piece of the Bot
writeBotAction(Col,Row,0):-
    write('Choosing Piece...\n'),
    letter(Row,LetterRow),
    sleep(1),    
    write('Chose: '),write(Col),write(' '),write(LetterRow),nl.
% Prints the Selected Cell to move to of the Bot
writeBotAction(Col,Row,1):-
    write('Moving to...\n'),
    letter(Row,LetterRow),
    sleep(1),
    write('Moved to: '),write(Col),write(' '),write(LetterRow),nl.

*/