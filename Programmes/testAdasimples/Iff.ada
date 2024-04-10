with Ada.Text_IO;use Ada.Text_IO;

procedure Iff is

    a: Integer;
    b: Integer;
    c: Integer;

begin
    a:= 5;
    if a = 5 then
        b:= 6;
    else
        b:= 7;
    end if;
    c := a + b; 
end Iff;