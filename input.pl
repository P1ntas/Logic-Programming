code_number(48, 0).
code_number(49, 1).
code_number(50, 2).
code_number(51, 3).
code_number(52, 4).
code_number(53, 5).
code_number(54, 6).
code_number(55, 7).
code_number(56, 8).


read_number(LowerBound, UpperBound, N):-
  format('Choose an Option (~d-~d) - ', [LowerBound, UpperBound]),
  peek_char(_Char),
  get_code(ASCII),
  code_number(ASCII, N),
  N =< UpperBound, N >= LowerBound, skip_line.
  
read_number(LowerBound, UpperBound, N):-
  write('Not a valid number!\n'), skip_line,
  read_number(LowerBound, UpperBound, N).

