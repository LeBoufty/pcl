with Ada.Text_IO;use Ada.Text_IO;

--mauvais opérateurs + puis - puis +

procedure mauvaisop is
    a: Integer;
    b: Integer;
    c: String;
    sortie: Boolean;

begin
    a := 2;
    b := a +-+ 2;
    a := -4;
end mauvaisop;