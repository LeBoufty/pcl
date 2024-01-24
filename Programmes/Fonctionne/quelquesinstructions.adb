with Ada.Text_IO;use Ada.Text_IO;

procedure Instructions is
    a: Integer;
    b: Integer;
    sortie: Boolean;
begin
    a := -4;
    a;
    b := a + 1;
    b := 1-1+1;
    b := 1*2+3*(4+5);
    b := (1-1+1*2*(1+(1*2)));
    if b > 0 then
        sortie := true;
    else
        sortie := false;
    end if;
end Instructions;
