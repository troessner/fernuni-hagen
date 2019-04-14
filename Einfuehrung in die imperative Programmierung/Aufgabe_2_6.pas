program Transponieren;

  const
    GROESSE = 5;
  type
    tMatrix = array [1..GROESSE,1..GROESSE] of integer;
  var
    A : tMatrix;
    tauschPuffer,
    i,
    j : integer;

  procedure First;
  begin
  for i := 1 to GROESSE-1 do
    for j := i+1 to GROESSE do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end  
  end;


  procedure Second;
  begin
  for i := 1 to GROESSE do
    for j := 1 to i do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end  
  end;


  procedure Third;
  begin
  for i := 1 to GROESSE do
    for j := 1 to GROESSE do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end  
  end;

  procedure Fourth;
  begin
  for i := 1 to GROESSE do
    for j := 1 to GROESSE-i do
    begin
      tauschPuffer := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := tauschPuffer
    end  
  end;


  procedure Fifth;
  begin
  for i := 1 to GROESSE-1 do
    for j := i+1 to GROESSE do
    begin
      tauschPuffer := A[i,j];
      A[j,i] := A[i,j];
      A[j,i] := tauschPuffer
    end  
  end;

begin
  A[1, 1] := 15;
  A[1, 2] := 8;
  A[1, 3] := 1;
  A[1, 4] := 24;
  A[1, 5] := 17;

  A[2, 1] := 16;
  A[2, 2] := 14;
  A[2, 3] := 7;
  A[2, 4] := 5;
  A[2, 5] := 23;  

  A[3, 1] := 22;
  A[3, 2] := 20;
  A[3, 3] := 13;
  A[3, 4] := 6;
  A[3, 5] := 4;

  A[4, 1] := 3;
  A[4, 2] := 21;
  A[4, 3] := 19;
  A[4, 4] := 12;
  A[4, 5] := 10;

  A[5, 1] := 9;
  A[5, 2] := 2;
  A[5, 3] := 25;
  A[5, 4] := 18;
  A[5, 5] := 11;

  {
  First();

  Ausgabe:

  Transponierte Matrix:
     15   16   22    3    9
      8   14   20   21    2
      1    7   13   19   25
     24    5    6   12   18
     17   23    4   10   11

  -> Korrekt.
  }

  {
  Second();

  Ausgabe:

  Transponierte Matrix:
     15   16   22    3    9
      8   14   20   21    2
      1    7   13   19   25
     24    5    6   12   18
     17   23    4   10   11  
  -> Korrekt.
  }

  {
  Third();

  Ausgabe:

  Transponierte Matrix:
   15    8    1   24   17
   16   14    7    5   23
   22   20   13    6    4
    3   21   19   12   10
    9    2   25   18   11
  -> *Nicht* korrekt. Grund liegt in "for j := 1 to GROESSE". Dadurch das es bis
     GROESSE geht und nicht bis i (wie in Second()) wird jede Tauschoperation doppelt
     ausgeführt und damit wieder rückgängig gemacht.
  }

  {
  Fourth();

  Ausgabe:

  Transponierte Matrix:
     15    8    1   24   17
     16   14    7    5   23
     22   20   13    6    4
      3   21   19   12   10
      9    2   25   18   11

  -> *Nicht* korrekt.
  }

  {
  Fifth();

  Ausgabe:

  Transponierte Matrix:
     15    8    1   24   17
      8   14    7    5   23
      1    7   13    6    4
     24    5    6   12   10
     17   23    4   10   11

  -> *Nicht* korrekt.
  }

  writeln('Transponierte Matrix:');
  for i := 1 to GROESSE do
  begin
    for j := 1 to GROESSE do write(A[i,j]:5);
    writeln('');
  end;  
end.


