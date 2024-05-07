with Ada.Text_IO;use Ada.Text_IO;

procedure Bool is

    a: Boolean;
    b: Boolean;
    x: Integer;
    y: Integer; 

begin
    Put(3=3);
    Put(3/=3);
    Put(false=false);
    Put((false=false)/=(true=true));
    a:=true;
    a:= a=((true=true) = (a=a));
    Put(a);
    Put(b);
    x:= 3;
    y:= 4;
    Put(x=y);
    Put(x/=y);
    Put(x>y);
    Put(x<y);
    Put(x>=y);
    Put(x<=y);
    Put(a=b);
    Put(a*b);
    Put(b);
    a:= true;
    Put(b);
end Bool;