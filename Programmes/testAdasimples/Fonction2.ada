with Ada.Text_IO;use Ada.Text_IO;

procedure Fonction2 is

    a: Integer;
    b: Integer;
    c: Integer;

    function PrintIfEqual0Or1 (x: Integer) return Integer is
        begin
            Put(a);
            Put(b);
            Put(c);
            Put(x);
            Put(x=1);
            Put(x/=0);
            if x = 1 then
                a := a + 3;
                b := b + 3;
                c := c + 3;
                return PrintIfEqual0Or1(x-1);
            elsif x /= 0 then
                return PrintIfEqual0Or1(x-1);
            end if;
            x:= 515+515-515;    
            return x;
        end PrintIfEqual0Or1;      

begin
    a := 1;
    b := 2;
    c := 3;
    Put(PrintIfEqual0Or1(3));
end Fonction2;