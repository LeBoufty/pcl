with Ada.Text_IO;use Ada.Text_IO;

procedure Iff is

    a: Integer;
    b: Integer;
    c: Integer;

begin
    a:= 5;
    put(a);
    if a = 8 then
        b:= 6;
        put(b);
    else
        b:= 7;
        put(b);
    end if;
    c := a + b; 
end Iff;