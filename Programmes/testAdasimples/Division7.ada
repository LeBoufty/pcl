with Ada.Text_IO;use Ada.Text_IO;

procedure Division6 is

    a: Integer;
    z: Integer;

begin
    z:= 20;
    a := z / 0; -- division by zero
    Put(a);
end Division6;