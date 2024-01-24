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
    a := lol(toto(10,2),2,atf(1));
    b := log(1);
    b := a + 1;
    b := 1-1+1;
    b := 1*2+3*(4+5);
    b := (1-2+3*4*(5+(6*7)));
    e.c := 1;
    e.f := a>=b=e.c;
    if b and b and then c or a or else 1 > 0 then
        sortie := true;
    else
        sortie := false;
    end if;
end quelquesinstructions;
