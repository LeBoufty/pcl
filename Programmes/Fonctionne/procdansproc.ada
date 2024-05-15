with Ada.Text_IO; use Ada.Text_IO;

procedure procdansproc is

    a: Integer := 1;

    procedure proc1(b: Integer) is

        procedure proc2(c: Integer) is

        begin
            Put(c);
        end proc2;

    begin
        proc2(b);
    end proc1;

begin
    proc1(a);
end procdansproc;