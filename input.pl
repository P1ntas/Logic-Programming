code_number(48, 0).
code_number(49, 1).
code_number(50, 2).
code_number(51, 3).
code_number(52, 4).
code_number(53, 5).
code_number(54, 6).
code_number(55, 7).
code_number(56, 8).
code_number(57, 9).


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
