program Max;

  const
    GRENZE = 10;
  type      
    tIndex = 1..GRENZE;
    tFeld = array [tIndex] of integer;
  var
    Feld : tFeld;
    w,
    w1,
    w2 : integer;

  function max (
               ParFeld: tFeld;
               von, bis: tIndex): integer;
    { bestimmt das Maximum im Teilfeld von ParFeld[von] 
      bis ParFeld[bis] }
    var
      Wert : integer;
      i : tIndex;
    begin
      Wert := ParFeld[von];
      writeln('Initialer Wert ist ', Wert, ', von ist: ', von, ', bis ist:', bis);
      
      for i := von + 1 to bis do
        if ParFeld[i] > Wert then
          begin
            writeln('ParFeld[i] ist > Wert, ParFeld[i]: ', ParFeld[i], ' i ist: ', i, ' und Wert: ', Wert);
            Wert := ParFeld[i];
          end;
      max := Wert;
    end; { max }  

  {
    Zu klären für alle 5 Prozeduren:
    
    Verlassen die Werte der aktuellen Parameter bei dem Aufruf  bzw. den Aufrufen der  Funktion max den durch die formalen Parameter definierten gültigen Wertebereich, egal welche integer-Werte im Feld vorkommen?
  }

  procedure A;
  begin
    {    
    Z.B. für Feld[GRENZE] = 32000000001 würde "bis" überlaufen.

    A() ist damit draußen.    
    }
    w := max (Feld, Feld[1], Feld[GRENZE]);
  end;

  procedure B;
  begin
    {    
    Die Parameter hängen nicht von FELD ab. B ist damit in Ordnung.    
    }
    w := max (Feld, (GRENZE-1) div 2,(GRENZE-1) div 2);
  end;


  procedure C;
  begin
    {
    Die Parameter hängen nicht von FELD ab. C ist damit in Ordnung.    
    }
    if max (Feld, 1, (GRENZE-1) div 2) >
          max (Feld, (GRENZE+1) div 2, GRENZE)
    then
      w := max (Feld, 1, (GRENZE-1) div 2)
    else
      w := max (Feld, (GRENZE+1) div 2, GRENZE);
  end;

  
  procedure D;
  begin
    {   
    Beim ersten Aufruf von max hängen die Parameter nicht von Feld ab. Damit sind wir im grünen Bereich.
    Beim zweiten Aufruf hängen die Parameter nun allerdings vom Feldwert ab.
    Wenn der größer als 0 ist ist alles ok da wir durch den if-guard sicherstellen, das wir
    kleiner als Grenze sind vor dem nächsten Aufruf.
    Was aber wenn alle Feldwerte negativ sind UND überlaufen? Z.b. für GRENZE := 3

      Feld[1] := -32000000001;
      Feld[2] := -44000000002;
      Feld[3] := -88000000001;

    Mit debug Ausgaben sieht das dann so aus:

      Initialer Wert ist -16385, von ist: 1, bis ist:3
      ParFeld[i] ist > Wert, ParFeld[i]: 18430 i ist: 2 und Wert: -16385
      w  ist: 18430

    Wie man sieht landet -32000000001 aus Feld[1] durch den Überlauf hier:

      Wert := ParFeld[von];
  
    wieder im legalen Bereich als -16385 und ist damit kleiner als der Überlauf
    von -44000000002 aus Feld[2], nämlich 18430.
    
    Heißt wenn wir diesen Aufruf machen:

      write (max (Feld, w, w));

    Mag w evtl. negativ sein (<= GRENZE) aber es ist auf jeden Fall im int Bereich.
    Damit ist D() in Ordnung.
    }
    w := max (Feld, 1, GRENZE);
    writeln('w  ist: ', w);

    if w <= GRENZE then
      begin
        writeln('w ist <= GRENZE', w);
        writeln('neuer max Aufruf: ', max (Feld, w, w));
      end;
  end;
  
  procedure E;
  begin
    {
    Die ersten beiden max Aufrufe:

    w1 := max (Feld, 1, GRENZE);
    w2 := max (Feld, 4, GRENZE-1);

    hängen nur von GRENZE ab. Das ist also ok. Da w2 nur auf einem Teilbereich
    von FELD ausgeführt wird *muss* es kleiner als w1 sein.
    
    Analysieren wir nun:

      if (0 < w2) and (w1 <= GRENZE) 

    w1 <= GRENZE -> wird sind irgendwo zwischen -INT_MAX
    (nicht -unendlich. Falls es einen Überlauf gab hat der schon stattgefunden) und 10.
    (0 < w2) -> Wie wir oben schon festgestellt hatten, muss w2 kleiner als w1 sein.
    Damit gilt: 0 < w2 <= w1 <= Grenze
    Wenn also diesen guard passieren sind sowohl w1 als auch w2 innerhalb von 1..10 mit w2 <= w1.

    * Der darauffolgende Aufruf

    w := max (Feld, 2, GRENZE);

    hängt ebenfalls nur von GRENZE ab. Der letzte aber nicht, der hängt von "w" ab. Theoretisch könnte es hier einen Überlauf geben.
    Da wir aber durch obige guard Analyse schon wissen das wenn wir hier sind, das Maximum zwischen 1 und 10 liegt ist auch E() ok. 
    }	
    w1 := max (Feld, 1, GRENZE);
    w2 := max (Feld, 4, GRENZE-1);
    if (0 < w2) and (w1 <= GRENZE) then
    begin
      w := max (Feld, 2, GRENZE);
      w := max (Feld, 1, w)
    end;
    
    writeln('Max ist ', w);
  end;

begin

  Feld[1] := -33;
  Feld[2] := -44;
  Feld[3] := -88;
  Feld[4] := 1;
  Feld[5] := 3;
  Feld[6] := -2;
  Feld[7] := 4;
  Feld[8] := 5;
  Feld[9] := 7;
  Feld[10] := 9;
  E();
end.


