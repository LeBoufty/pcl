with Ada.Text_IO;use Ada.Text_IO;

procedure quelquesinstructions is
    a: Integer;
    b: Integer;
    sortie: Boolean;
    type recorda is record
        c: Integer;
        d: String;
        f: Boolean;
    end record;
    e : recorda;
begin
    a := -4;
    a;
    b := a + 1;
    b := 1-1+1;
    b := 1*2+3*(4+5);
    b := (1-1+1*2*(1+(1*2)));
    e.c := 1;
    e.f := a>=b=e.c;
    a := a rem b;
    a:= a * b + (a rem b + 1);
    if b > 0 then
        sortie := true;
    else
        sortie := false;
    end if;
end quelquesinstructions;
