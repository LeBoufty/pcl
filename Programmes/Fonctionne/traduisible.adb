with Ada.Text_IO;use Ada.Text_IO;

procedure traduisible is
    a: Integer;
    b: Integer;

    function f(x: Integer) return Integer is
    begin
        return x + 1;
    end f;

begin
    if a = b then
        b := b + 1;
    elsif a < b then
        a := a + 1;
    elsif a > b then
        b := b + 1;
        b := b + 1;
    else
        a := a + 1;
    end if;

    if a = b then
        b := b + 1;
    end if;
end traduisible;
