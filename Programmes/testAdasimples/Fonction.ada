with Ada.Text_IO;use Ada.Text_IO;

procedure Fonction is

    a: Integer;

    function Add100(x: Integer; x2: Integer) return Integer is

    y: Integer := x;

    begin
        x := x + 100;
        return x;
    end Add100;

begin
    a := 10;
    a := Add100(a,515);
end Fonction;