program merge (input, output);
{ liest ohne Eingabeueberpruefung zwei sortierte Felder mit 
  integer-Zahlen ein; beide Felder werden in einem weiteren Feld
  sortiert zusammengefuegt; das Ergebnis wird ausgegeben; ist 
  die Eingabe unsortiert, so ist das Ergebnisfeld undefiniert }
  const
  FELDLAENGE1 = 5;
  FELDLAENGE2 = 8;
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

  while (i <= FELDLAENGE1) or (j <= FELDLAENGE2) do
  begin

    { Erster Fall: Wir haben das Ende von Feld 1 erreicht: Kopiere das was von Feld 2 noch nicht
      prozessiert wurde zum Ergebnisfeld. }
    if (i > FELDLAENGE1) then
    begin
      for k := j to FELDLAENGE2 do
      begin
        ErgebnisFeld[i + k - 1] := Feld2[k];
      end;
    j := FELDLAENGE2 + 1;
    end
    
    {  Zweiter Fall: Wir haben das Ende von Feld 2 erreicht: Analog zum ersten Fall oben. }
    else if (j > FELDLAENGE2) then
    begin  
      for k := i to FELDLAENGE1 do
      begin
        ErgebnisFeld[j + k - 1] := Feld1[k];        
      end;
    i := FELDLAENGE1 + 1;
    end

    { Dritter Fall: Vergleiche die beiden aktuellen Felder. Wenn das i-te kleiner-gleich ist, kopiere
      das ins Ergebnisfeld und inkrementiere i. Wenn das j-te kleiner ist genau andersrum. }    
    else
    begin
      if (Feld1[i] <= Feld2[j]) then
      begin
        ErgebnisFeld[i + j - 1] := Feld1[i];
        i := i + 1;
      end
      else
      begin
        ErgebnisFeld[i + j - 1] := Feld2[j];
        j := j + 1;
      end;
    end;
  end;
  
  writeln('Das Ergebnisfeld ist: ');
  for k := 1 to ERGEBNISFELDLAENGE do
    write (ErgebnisFeld[k], ' ');
  writeln
end.
