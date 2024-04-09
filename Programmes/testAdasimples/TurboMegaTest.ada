with Ada.Text_IO;use Ada.Text_IO;

procedure TurboMegaTest is

    function somme4(a1: Integer; a2: Integer; a3: Integer; a4: Integer) return Integer is
    somme: Integer;
    begin
        somme := a1 + a2 + a3 + a4;
        return somme;
    end somme4;


    a: Integer;
    b: Integer;
    c: Integer;
    d: Integer;
    e: Integer;

begin
    a:= 1;
    b:= a + 1 - 1;
    c:=2;
    d:=a+c;
    e:=c+a;
    Put(a);
    Put(b);
    Put(c);
    Put(d);
    Put(e);

    a:=2;
    b:=3;
    c:=a/b;
    d:=b/a;
    Put(a);
    Put(b);
    Put(c);
    Put(d);

    a:=1;
    b := somme4(a,a,a,a);
    c:=3;
    Put(a);
    Put(b);

    
end TurboMegaTest;
