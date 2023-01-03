choose_random_number(Start, End, Result) :-
  random_between(Start, End, Result).

choose_random_number_from_list(Numbers, Result) :-
  random_member(Result, Numbers).

remove_from_list( _, [], []).
remove_from_list( R, [R|T], T).
remove_from_list( R, [H|T], [H|T2]) :- H \= R, remove_from_list( R, T, T2).