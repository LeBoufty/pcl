with Ada.Text_IO;use Ada.Text_IO;

procedure erreur9 is

    function bab(lo : Integer) return Integer is
    o : Integer := 1;
    begin
        o := o + 1;
        return o;
    end;

    bq : Integer := 1;
    
begin

    bq :=bab1(1);
    bq := 1;

end;