with Ada.Text_IO;use Ada.Text_IO;

procedure diff_tribo_fibo is

    n: Integer;

    procedure acc_fib_trib(n: Integer) is

        trib: Integer;
        fib: Integer;
        f0: Integer;
        f1: Integer;
        f2: Integer;

        function fibonacci(n: Integer; x1: Integer; x2: Integer) return Integer is
            begin
                if n = 0 then
                    return x1;
                else
                    return fibonacci(n - 1, x2, x1 + x2);
                end if;
                return 0;
            end fibonacci;

        function tribonacci(n: Integer; x1: Integer; x2: Integer; x3: Integer) return Integer is
            begin
                if n = 0 then
                    return x1;
                else 
                    if n = 1 then
                        return x2;
                    else
                        if n = 2 then
                            return x3;
                        else
                            return tribonacci(n-1, x2, x3, x1+x2+x3);
                        end if;
                    end if;
                end if;
                return 0;
            end tribonacci;

        function get_acceleration(f0: Integer; f1: Integer; f2: Integer; n1: Integer; n2: Integer) return Integer is
            begin
                return (f2-2*f1+f0)/((n2-n1)*(n-n1));
            end get_acceleration;

    begin
        trib = tribonacci(n, 0, 1, 1);
        fib = fibonacci(n, 0, 1);
        Put(trib);
        Put(fib);
        Put(trib-fib);
        if n > 1 then
            f0 = tribonacci(n - 2, 0, 1, 1) - fibonacci(n - 2, 0, 1);
            f1 = tribonacci(n - 1, 0, 1, 1) - fibonacci(n - 1, 0, 1);
            f2 = trib - fib ;
            Put(get_acceleration(f0, f1, f2, n - 1, n));
        else
        end if;
    end acc_fib_trib;

begin
    n = 5;
    acc_fib_trib(n);
end diff_tribo_fibo;