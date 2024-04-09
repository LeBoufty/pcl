with Ada.Text_IO;use Ada.Text_IO;

procedure Addition10 is

    k: Integer;
    y: Integer;
    z: Integer;

begin
    z:= 257;
    y:= 8193;
    k := z + y;
    Put(z);
    Put(y);
    Put(k);
end Addition10;