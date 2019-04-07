program merge (input, output);
{ liest ohne Eingabeueberpruefung zwei sortierte Felder mit 
  integer-Zahlen ein; beide Felder werden in einem weiteren Feld
  sortiert zusammengefuegt; das Ergebnis wird ausgegeben; ist 
  die Eingabe unsortiert, so ist das Ergebnisfeld undefiniert }
  const
  FELDLAENGE1 = 2; // TODO Set back to 5 and 8 below.
  FELDLAENGE2 = 3;
  ERGEBNISFELDLAENGE = 13; { FELDLAENGE1 + FELDLAENGE2 }
        
  type
  tFeld1 = array [1..FELDLAENGE1] of integer;
  tFeld2 = array [1..FELDLAENGE2] of integer;
  tErgebnisFeld = array [1..ERGEBNISFELDLAENGE] of integer;

  var
  Feld1 : tFeld1;
  Feld2 : tFeld2;
  ErgebnisFeld : tErgebnisFeld;
  i : integer;
  j : integer;
  k : integer;
  PositionErgebnisFeld : integer;
begin
  { sortierte Felder einlesen }
  writeln ('Bitte', FELDLAENGE1:2, ' Werte des ersten Feldes ',
                                         'sortiert eingeben!');
  for i := 1 to FELDLAENGE1 do
    readln (Feld1[i]);
  writeln ('Bitte', FELDLAENGE2:2, ' Werte des zweiten Feldes ',
           'sortiert eingeben!');
  for j := 1 to FELDLAENGE2 do
    readln (Feld2[j]);

  i := 1;
  j := 1;

  // FELDLAENGE1 = 2, FELDLAENGE2 = 3, FELD1 = 2,5, FELD2=1,2,3
  // EF = 1, i=1, j=2
  // EF = 1,2 i=2, j=2
  // EF = 1,2,2 i=2, j=3
  // EF = 1,2,2,3 i=2, j=4
  while (i <= FELDLAENGE1) or (j <= FELDLAENGE2) do
  begin
  
    if (i > FELDLAENGE1) then
    begin
      for k := j to FELDLAENGE2 do
      begin
        PositionErgebnisFeld := i + k - 1;
        ErgebnisFeld[PositionErgebnisFeld] := Feld2[k];
      end;
    break;
    end
    
    else if (j > FELDLAENGE2) then
    begin
      for k := i to FELDLAENGE1 do
      begin
        PositionErgebnisFeld := i + k - 1;
        ErgebnisFeld[PositionErgebnisFeld] := Feld1[k];
      end;
    break;
    end
    
    else
    begin
      PositionErgebnisFeld := i + j - 1;
      if (Feld1[i] <= Feld2[j]) then
      begin
        ErgebnisFeld[PositionErgebnisFeld] := Feld1[i];
        i := i + 1;
      end
      else
      begin
        ErgebnisFeld[PositionErgebnisFeld] := Feld2[j];
        j := j + 1;
      end;
    end;
  end;
  writeln('Ergebnis: ');
  for k := 1 to ERGEBNISFELDLAENGE do
    writeln(ErgebnisFeld[k]);
end.

    // Zweiter Fall: Wir haben das Ende von Feld 1 erreicht: Kopiere das was von Feld 2 noch nicht prozessiert wurde zum Ergebnisfeld.
    // Falls wir auch schon das Ende von Feld 2 erreicht haben wird nichts kopiert. 

    // Dritter Fall: Wir haben das Ende von Feld 2 erreicht: Analog zum ersten Fall oben. 

    // Vierter Fall: Vergleiche die beiden aktuellen Felder. Wenn das i-te kleiner-gleich ist, kopiere das ins Ergebnisfeld und inkrementiere i.
    // Wenn das j-te kleiner ist genau andersrum.
