with Ada.Text_IO;use Ada.Text_IO;

procedure Fonction_Extended is

    a: Integer;

    function Add100(a: Integer) return Integer is
        function Add1(a: Integer; n: Integer) return Integer is
            begin
                    Put(a);
                    Put(n);
                if n = 0 then
                    return a;
                else
                    return Add1(a + 1, n - 1);
                
                return 0;
                end if;
            end Add1;
    begin
        return Add1(a, 100);
    end Add100;

    function Add(a: Integer; n: Integer) return Integer is
        pas : Integer;
        begin
            pas := 1;
            if n = 0 then
                return a;
            else
                return Add(a + pas, n - pas);
            end if;
        end Add;


begin
    a := 0;
    a := Add100(a);
    Put(a);
    a := Add(a, 10);
    Put(a);
end Fonction_Extended;