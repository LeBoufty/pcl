with Ada.Text_IO;use Ada.Text_IO;

procedure Fonction is

    a: Integer;

    function Add100(x: Integer) return Integer is
    begin
        Put(x);
        x := x + 100;
        return x;
    end Add100;

begin
    a := 10;
    a := Add100(a);
    Put(a);
end Fonction;