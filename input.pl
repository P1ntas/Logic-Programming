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


read_number(LowerBound, UpperBound, N):-
  format('Choose an Option (~d-~d) - ', [LowerBound, UpperBound]),
  get_code(ASCII),
  code_number(ASCII, N),
  check_number(LowerBound, UpperBound, N).

check_number(LowerBound, UpperBound, N) :-
  N =< UpperBound, N >= LowerBound, skip_line.

check_number(LowerBound, UpperBound, N) :-
  (N > UpperBound; N < LowerBound),
  write('Not a valid number!\n'), skip_line,
  read_number(LowerBound, UpperBound, N),
  check_number(LowerBound, UpperBound, N).


read_input(SizeX, SizeY, X, Y):-
  read_col(Col, SizeX),
  check_col(Col, X, SizeX),
  read_row(Row, SizeY),
  check_row(Row, Y, SizeY).

read_col(Col, SizeX):-
  format('Pick a column (0 - ~d) : ', SizeX-1),
  get_code(Col).

check_col(AsciiCol, NumCol, SizeX):-
  code_number(AsciiCol, NumCol),
  NumCol < SizeX, NumCol >= 0, skip_line.


check_col(_, NumCol, SizeX):-
  (NumCol >= SizeX; NumCol < 0),
  format('Invalid column! It must be a number between 0 - ~d \n', SizeX-1),
  skip_line,
  read_col(Col, SizeX),
  check_col(Col, NumCol, SizeX).

read_row(Row, SizeY):-
  format('Pick a row (0 - ~d) : ', SizeY-1),
  get_code(Row).

check_row(AsciiRow, NumRow, SizeY):-
  code_number(AsciiRow, NumRow),
  NumRow < SizeY, NumRow >= 0, skip_line.

  check_row(_, NumRow, SizeY):-
  (NumRow >= SizeY; NumRow < 0),
  format('Invalid row! It must be a number between 0 - ~d \n', SizeY-1),
  skip_line,
  read_row(Row, SizeY),
  check_row(Row, NumRow, SizeY).

  /*read_number(Number) :-
    write('Enter a number: '),
    read_line_to_codes(user_input, Codes),
    number_codes(Number, Codes).*/
