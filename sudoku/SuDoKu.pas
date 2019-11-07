Program SuDoKu_sprendejas;
   Uses Crt;
   Type eil = array[1..9] of byte;
        SuDoKu = array[1..9] of eil;

  Procedure ivedimas (var SDK : SuDoKu);
        var X, Y : byte;
            i, j, k : byte;
    begin
      X := 1;
      Y := 2;

      Write(#201);
      For k:= 1 to 35 do
        if k mod 12 = 0
          then Write(#203)
          else Write(#205);
      Write(#187);

      For i := 1 to 9 do               // eilutës
        begin
          For j := 1 to 9 do           // stulpeliai
            begin
              GoToXY(x,y);
              if j mod 3 = 1           // atskiriami stulpeliai
                then Write(#186, ' ')    // po 3 (Raðo ||)
                else Write(#179, ' ');   // po 1 (raðo |)
              ReadLn(SDK[i,j]);        //  sekantis skaicius - sekanti pozicija
              X := X + 4;
            end;
          GoToXY(37, WhereY-1);        // nes ReadLN perkelia i kita eil
          WriteLn(#186);               // priraðo eilutës gale ||
          //------------

         if (i mod 3=0) and (i<>9)              // tarpai tarp eiluciu
            then begin
                   Write(#204);
                   For k:= 1 to 35 do
                     if k mod 12 = 0
                       then Write(#206)
                       else Write(#205);
                   Write(#185);
                    Y := Y + 1;    // perkelia i kita eil (WriteLn kas kita) ^
                 end;
          if (i mod 3<>0) and (i<>9)
             then begin
                    Write(#186);
                    For k:= 1 to 35 do
                    if k mod 4 = 0
                       then if k mod 12 = 0
                              then Write(#186)
                              else Write(#197)
                       else Write(#196);
                    WriteLn(#186);
                    Y := Y + 1;    // perkelia i kita eil (WriteLn kas kita) ^
                  end;
          X := 1;
          y := y + 1;             // nes virsuje ^^^ GoToXY(X, WhereY-1)
        end;   // for i := 1 to 9

      Write(#200);
      For i:= 1 to 35 do
        if i mod 12 = 0
          then Write(#202)
          else Write(#205);
      WriteLn(#188);
      WriteLn;
      Write('ENTER');
      ReadLn
    end;  // ivedimo

  Procedure sprendimas(var SDK : SuDoKu);
        var i, j : byte;
            //x : byte;
            tr : byte;  // kiek sk. trûksta iki uþpildymo
            done : boolean;
            sprx,
            spry : eil;
    begin
      tr := 0;
      For i := 1 to 9 do
        for j := 1 to 9 do
          if (SDK[i,j] = 0)           //or (SDK[i,j] > 9)
             then tr := tr + 1;
      WriteLn(' Iki sio SuDoKu uzpildymo truksta ', tr, ' skaiciu.');
      i := 1; j := 1;
      Repeat
        if SDK[i,j] = 0
           then begin
                  for x := 1 to 9 do
                    if SDK[i,x]<> 0
                       then sprx[SDK[x,j]] := SDK[x,j];
                  for y := 1 to 9 do
                    if SDK[y,j]<> 0
                       then spry[SDK[x,j]] := SDK[x,j];;

        j := j + 1;
      done := TRUE;
      Until done;
    end;

   Var SDK : SuDoKu;

Begin
  ClrScr;

  Ivedimas(SDK);
  Sprendimas(SDK);
  
 ReadLn
End.
