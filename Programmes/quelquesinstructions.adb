with Ada.Text_IO;use Ada.Text_IO;

procedure Instructions is
    a: Integer;
    b: Integer;
    sortie: Boolean;
begin
    a := -4;
    b := a + 1;
    if b > 0 then
        sortie := true;
    else
        sortie := false;
    end if;
end Instructions;
