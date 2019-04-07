// A 1.4
// Schreiben Sie ein PASCAL-Programm, das eine Temperaturangabe in 
// Fahrenheit (F) einliest, den Wert in Celsius (C) umwandelt und auf dem Bildschirm ausgibt.


{$ASSERTIONS on}

program FahrenheitZuCelcius;

{$mode objfpc}
Uses SysUtils;

function ZuCelcius(const Fahrenheit: real) : real;
begin
	ZuCelcius := ((5 * (Fahrenheit - 32)) / 9);
end;

procedure Main();
var 
	Eingabe: string;
	Fahrenheit: real;
begin
	writeLn('Bitte Fahrenheit als Gleitzahl eingeben mit Punkt als Trenner (z.B. 73.4):');
	readLn(Eingabe);
	Try
		Fahrenheit := StrToFloat(Eingabe);
		writeLn('Eingegeben: ', Eingabe);
		writeLn('In Celcius: ', ZuCelcius(Fahrenheit));
    except
      On E : Exception do
        Writeln('Fehlerhafte Eingabe, kann ', Eingabe, ' nicht konvertieren, Fehlermeldung: ', E.Message);
    end;		
end;

procedure Test();
begin
	writeln('Testlauf...');
    assert(ZuCelcius(33) > 0.55, '33 Fahrenheit sollte größer als 0.55 sein');
    assert(ZuCelcius(33) < 0.56, '33 Fahrenheit sollte kleiner als 0.56 sein');
    assert(ZuCelcius(569.2) > 298.4, '569.2 Fahrenheit sollte größer als 298.4 sein');
    assert(ZuCelcius(569.2) < 298.5, '569.2 Fahrenheit sollte kleiner als 298.5 sein');
end;

begin
	Main();
end.
