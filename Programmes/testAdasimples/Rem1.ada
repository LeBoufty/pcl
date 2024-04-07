with Ada.Text_IO;use Ada.Text_IO;

procedure Rem1 is

    a: Integer;
    b: Integer;
    c: Integer;

begin
    a:= 2;
    a := 54 rem 10; --4
    Put(a);
    b := a rem 3; --1
    Put(b);
    c := b rem 54; --1
    Put(c);
    a:= 60283;
    b := 82;
    c := a rem b; -- 13
    Put(c);
end Rem1;