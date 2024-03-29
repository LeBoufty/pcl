with Ada.Text_IO;use Ada.Text_IO;

procedure testctrlsem is

    a: Integer;
    b: Integer;

    function Carre(X : Integer) return Integer is
    begin
        return X * X;
    end Carre;

    procedure Main is
        Num : Integer;
    begin
        Num := 2;

        Num := Carre(Num);
    end Main;

begin
    a := 3;
    b := 4;
    Main;
end testctrlsem;