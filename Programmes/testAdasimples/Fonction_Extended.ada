with Ada.Text_IO;use Ada.Text_IO;

procedure Fonction_Extended is

    a: Integer;

    function Add100(a: Integer) return Integer is
        function Add1(a: Integer; n: Integer) return Integer is
            res : Integer;
            begin
                    --Put(a);
                    --Put(n);
                if n = 0 then
                    res := a;
                else
                    res := Add1(a + 1, n - 1);
                end if;
                return res;
            end Add1;
    begin
        return Add1(a, 100);
    end Add100;

    function Add(a: Integer; n: Integer) return Integer is
        pas : Integer;
        res : Integer;
        begin
            pas := 1;
            if n = 0 then
                res := a;
            else
                res := Add(a + pas, n - 1);
            end if;
            return res;
        end Add;

    function Times515(a: Integer) return Integer is
        b : Integer;

        function Add515(a: Integer) return Integer is
            begin
                if a = 0 then
                    return 0;
                else
                    return b + Add515(a - 1);
                end if;
                return 0;
            end Add515;
        begin
            b := 515;
            return Add515(a);
        end Times515;

begin
    a := 0;
    a := Add100(a);
    Put(a);
    a := Add(a, 10);
    Put(a);
    a := 17;
    Put(a);
    a := Times515(a);
    Put(a);
end Fonction_Extended;