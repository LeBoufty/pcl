with Ada.Text_IO;use Ada.Text_IO;

procedure Bool is

    a: Boolean;
    b: Boolean;

begin
    Put(3=3);
    Put(3/=3);
    Put(false=false);
    --Put((false=false)/=(true=true));
    a:=true;
    --a:= a=((true=true) = (a=a));
    b:=a;
    Put(a);
    Put(2<=3);
    Put(3>=2);
    Put(2>=2);
    Put(2<=2);
    Put(2>=3);
    Put(2<3);
    Put(2>3);
    Put(2=3);
    Put(2/=3);
    Put(2=2);
    Put(2/=2);
    Put(a=b);
    Put(a*b);
    Put(b);
    a:= true;
    b:= a + a + a;
    Put(b);
end Bool;