choose_random_number(Start, End, Result) :-
  random_between(Start, End, Result).

choose_random_number_from_list(Numbers, Result) :-
  random_member(Result, Numbers).

remove_from_list( _, [], []).
remove_from_list( R, [R|T], T).
remove_from_list( R, [H|T], [H|T2]) :- H \= R, remove_from_list( R, T, T2).

count_elem(Board, Count, Player) :-
    flatten(Board, FlatBoard), 
    count(Player, FlatBoard, Count). 

count(_, [], 0). 
count(X, [X|Tail], N) :- 
    count(X, Tail, M), 
    N is M + 1. 
count(X, [Y|Tail], N) :- 
    X \= Y, 
    count(X, Tail, N). 