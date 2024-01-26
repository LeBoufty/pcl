with Ada.Text_IO; use Ada.Text_IO;

procedure Fibonacci is
    function Fib(n: Integer) return Integer is
    begin
        if n = 0 then 
            return 0;
        elsif n = 1 then
            return 1;
        else
            return Fib(n - 1) + Fib(n - 2);
        end if;
    end Fib;

    --Variables
m : Integer := 10;
res : Integer := 0;

    --Main
begin
    res := - 1 - 2 + 3 + 4 - 5;
    --put("Fibonacci de " & n'Image);
    --put(" est :" & res'Image); 'aB'
end Fibonacci;