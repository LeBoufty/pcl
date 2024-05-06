with Ada.Text_IO;use Ada.Text_IO;

procedure Fonction2 is

    a: Integer;
    b: Integer;
    c: Integer;

    function PrintIfEqual0Or1 (x: Integer) return Integer is
        begin
            if x = 0 then
                Put(a);
                Put(b);
                Put(c);
            elsif x = 1 then
                Put(a);
                Put(b);
                Put(c);
                a := a + 3;
                b := b + 3;
                c := c + 3;
                return PrintIfEqual0Or1(x-1);
            else
                return PrintIfEqual0Or1(x-1);
            end if;
            return x;
        end PrintIfEqual0Or1;      

begin
    a := 1;
    b := 2;
    c := 3;
    Put(PrintIfEqual0Or1(3));
end Fonction2;