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
    --Ada.Text_IO.Put("Fibonacci de " & n'Image);
    --Ada.Text_IO.Put(" est :" & res'Image);
end Fibonacci;

