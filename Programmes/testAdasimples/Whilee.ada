with Ada.Text_IO;use Ada.Text_IO;

procedure Whilee is

    a: Integer;

begin
    a:= 5;
    while a /= 6 loop
        Put(a);
        a:= a - 1;
    end loop;
    put(a);
end Whilee;