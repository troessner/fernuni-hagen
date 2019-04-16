{
* Ergebnis:
* 1.) "Die Parameterübergaben beider Prozeduren erfolgen als var-Parameter." -> 1, -3, 4
* 2.) "Die Parameterübergaben beider Prozeduren erfolgen als Wertparameter." -> 1, 5, 6
* 3.) "Die Parameterübergabe erfolgt bei der Prozedur globalProc als var-Parameter
*     und bei der Prozedur lokalProc als Wertparameter." -> 1, -3, 4
* 4.) "Die Parameterübergabe erfolgt bei der Prozedur globalProc als
*     Wertparameter und bei der Prozedur lokalProc als var-Parameter." -> 1, 5, 6
* 5.) "	Die Ausgabe des Programms ist unabhängig von der Art der Parameterübergabe."
*     -> Offensichtlich falsch, siehe Ergebnisse oben.
* }


program Parameter1 (output);
{ Dieses Programm hat keine sinnvolle Semantik, zeigt schlech-
  ten Programmierstil und dient nur zum Ueben der Parameterueber-
  gabearten. }

  var 
  a,
  b,
  c : integer;

  // Ursprünglicher Aufruf via call-by-value, produziert nicht das gewünschte Ergebnis 1, -3, 4
  procedure globalProc ({call_by_1} d, e, f: integer);
  // procedure globalProc ({call_by_1} var d, e, f: integer);

    var 
    a : integer; 

    // Ursprünglicher Aufruf via call-by-value, produziert nicht das gewünschte Ergebnis 1, -3, 4
    // procedure lokalProc ({call_by_2} g, h, i: integer);
    procedure lokalProc ({call_by_2} var g, h, i: integer);

      var 
      b : integer;

    begin
      g := h + i;
      b := c;
      a := 2 * b;
      i := a + b
    end; { lokalProc }

  begin
    a := 4;
    b := 5;
    c := 6;
    d := e - f;
    lokalProc (a, d, e);
    e := f - d
  end; { globalProc }

begin
  a := 1;
  b := 2;
  c := 3;
  globalProc (c, b, a);
  writeln (a, ' ', b, ' ', c)
end. { Parameter1 }
