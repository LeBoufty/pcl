with Ada.Text_IO;use Ada.Text_IO;

--div par zero

procedure divparzero is
    a: Integer;
    b: Integer;
    sortie: Boolean;

begin
    a := 1/0;
    b := a;
    a := -4;
end divparzero;