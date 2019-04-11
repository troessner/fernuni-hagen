program binaer (input, output);
  const
    FELDGROESSE = 10;

  var
    unten, oben, Mitte : integer;
    Feld : array[1..FELDGROESSE] of integer;
    Suchwert : integer;
    gefunden : boolean;

procedure A();
begin
  unten := 1;
  oben := FELDGROESSE;
  repeat
    Mitte := (oben + unten) div 2;
    
    if Suchwert > Feld[Mitte] then
      unten := Mitte + 1;
    if Suchwert < Feld[Mitte] then
      oben := Mitte - 1;
    gefunden := (Suchwert = Feld[Mitte]) 
  until gefunden or (unten > oben);
end;

{ B terminiert nie wenn der Suchwert nicht enthalten ist }
procedure B();
begin
  unten := 1;
  oben := FELDGROESSE;
  repeat
  
    Mitte := (oben + unten) div 2;
    if Suchwert > Feld[Mitte] then
      unten := Mitte
    else
      oben := Mitte;
    gefunden := (Feld[Mitte] = Suchwert) 
  until gefunden or (unten >= oben);
end;

procedure C();
begin	
  gefunden := false;
  unten := 1;
  oben := FELDGROESSE;
  while (unten < oben) and not gefunden do
  begin
    Mitte := (oben + unten) div 2;
    if Suchwert = Feld[Mitte] then
      gefunden := true
    else
      if Suchwert < Feld[Mitte] then
        oben := Mitte - 1
      else
        unten := Mitte + 1
  end; 
end;

procedure D();
begin
  gefunden := false;
  unten := 1;
  oben := FELDGROESSE;
  while (unten <= oben) and not gefunden do
  begin
    Mitte := (oben + unten) div 2;
    if Suchwert = Feld[Mitte] then
      gefunden := true
    else
      if Suchwert < Feld[Mitte] then
        oben := Mitte - 1
      else
        unten := Mitte + 1
  end; 
end;

procedure E();
begin    
  unten := 1;
  oben := FELDGROESSE;
  repeat
    Mitte := (oben + unten) div 2;
    if Suchwert <= Feld[Mitte] then
      oben := Mitte - 1;
    if Feld[Mitte] <= Suchwert then
      unten := Mitte + 1;
  until (unten > oben);
  gefunden := (Feld[Mitte] = Suchwert);
end;

begin
  Feld[1] := 3; 
  Feld[2] := 7; 
  Feld[3] := 12; 
  Feld[4] := 33; 
  Feld[5] := 45; 
  Feld[6] := 66; 
  Feld[7] := 68; 
  Feld[8] := 77; 
  Feld[9] := 79; 
  Feld[10] := 88; 
  Suchwert := 11;

  B();
  writeln('gefunden: ', gefunden);  
end.

{
Ergebnis:
* A, C, D und E terminieren korrekt sowohl für 12 (enthalten) als auch 11 (nicht enthalten)
* B terminiert nie wenn der Suchwert nicht enthalten ist
}
