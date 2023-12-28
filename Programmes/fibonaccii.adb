with Ada.Text_IO; use Ada.Text_IO;

procedure Fibonacci is
    function Fib(n: Natural) return Natural is
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
n : Natural := 10;
res : Natural := 0;

    --Main
begin
    res := Fib(n);
    --put("Fibonacci de " & n'Image);
    --put(" est :" & res'Image); 'aB'
end Fibonacci;