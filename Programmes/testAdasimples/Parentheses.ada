with Ada.Text_IO;use Ada.Text_IO;

procedure Parentheses is

    k: Integer;
    y: Integer;
    z: Integer;

begin
    z:= 5;
    y:= 3;
    k := z * (10 + y + 60 * 7);
    Put(z);
    Put(y);
    Put(k);
end Parentheses;