
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


between(Y, Min, Max) :-
  (Y =< Max, Y >= Min).


read_input(SizeX, SizeY, X, Y):-
  read_number1(0, SizeX, X, 'Pick a column (0 - 18)'),
  read_number1(0, SizeY, Y, 'Pick a row (0 - 9)').
