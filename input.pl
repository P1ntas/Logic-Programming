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
  get_code(ASCII),
  code_number(ASCII, N),
  N =< UpperBound, N >= LowerBound, skip_line.
  
read_number(LowerBound, UpperBound, N):-
  write('Not a valid number!\n'), skip_line,
  read_number(LowerBound, UpperBound, N).

read_input(Size, X, Y):-
  read_col(Col, Size),
  check_col(Col, X, Size),
  read_row(Row, Size),
  check_row(Row, Y, Size).

read_col(Col, Size):-
  format('Pick a column (0 - ~d) : ', Size-1),
  get_code(Col).

check_col(AsciiCol, NumCol, Size):-
  code_number(AsciiCol, NumCol),
  NumCol < Size, NumCol >= 0, skip_line.

check_col(_, NumCol, Size):-
  format('Invalid column! It must be a number between 0 - ~d \n', Size-1),
  skip_line,
  read_col(Col, Size),
  check_col(Col, NumCol, Size).

read_row(Row, Size):-
  format('Pick a row (0 - ~d) : ', Size-1),
  get_code(Row).

check_row(AsciiRow, NumRow, Size):-
  code_number(AsciiRow, NumRow),
  NumRow < Size, NumRow >= 0, skip_line.

  check_row(_, NumRow, Size):-
  format('Invalid row! It must be a number between 0 - ~d \n', Size-1),
  skip_line,
  read_row(Row, Size),
  check_row(Row, NumRow, Size).