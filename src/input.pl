% Reads input number
read_number(Min, Max, X) :-
    repeat,
        read(Y),
        (  (integer(Y), between(Y, Min, Max))
        ->  X = Y,
            !, true
        ;   write('Not a valid number!\n'),
            nl,
            fail
        ).

% Reads input number
read_number1(Min, Max, X, Request) :-
    repeat,
        write(Request),
        read(Y),
        (  (integer(Y), between(Y, Min, Max))
        ->  X = Y,
            !, true
        ;   format('\nInvalid value! Must be between ~d and ~d\n', [Min, Max]),
            nl,
            fail
        ).

% Checks if number is between two others
between(Y, Min, Max) :-
  (Y =< Max, Y >= Min).

% Gets input
read_input(SizeX, SizeY, X, Y):-
  read_number1(1, SizeX, X, 'Pick a column (1 - 18)'),
  read_number1(1, SizeY, Y, 'Pick a row (1 - 9)').
