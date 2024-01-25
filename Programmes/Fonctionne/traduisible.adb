with Ada.Text_IO;use Ada.Text_IO;

procedure traduisible is
    function f(n: Integer; p: Integer) return Integer is
        salut: Integer;
        bonsoir: Integer;
    begin
        salut := - n * p;
        return salut;
    end f;
    a: Integer;
    b: Integer;
    c: Integer;
begin
    a := 0;
    b := -5;
    c := a - b + 1;
    b := f(a, c);
end traduisible;
