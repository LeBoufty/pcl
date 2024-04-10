with Ada.Text_IO;use Ada.Text_IO;

procedure TurboMegaTest is

    a: Integer := 1;
    b: Integer := 2;
    c: Integer := 3;
    d: Integer; 
    e: Integer := 5;
    f: Boolean;
    g: Boolean := true;

begin
    a:= 1;
    b:= a + 1 - 1;
    c:=2;
    c:= 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10;
    a:= c + c + c + c + c + c + c + c + c + c;
    d:=a+c;
    e:=c+a;
    Put(a);
    Put(b);
    Put(c);
    Put(d);
    Put(e);

    a := 2;
    a := a+ -1;
    b := 2;
    b := -1 + b;
    Put(b);

    a:=2;
    b:=3;
    c:=a/b;
    d:=b/a/c;
    Put(a);
    Put(b);
    Put(c);
    Put(d);

    a:=2;
    b:=3;
    c:=a*b;
    d:=b*a;
    e:=a*50;
    Put(a);
    Put(b);
    Put(c);
    Put(d);
    Put(e);

    a:=287;
    b:=17;
    c:= a rem b;
    d:= b rem a;
    Put(a);
    Put(b);
    Put(c);
    Put(d);

    a:= 2;
    b:= 3;
    c:= 4;
    d:= b+c*a*a+ b rem c;
    Put(a);
    Put(b);
    Put(c);
    Put(d);

    Put(3=3);
    Put(3/=3);
    Put(false=false);
    --Put((false=false)/=(true=true));
    f:=true;
    --f:= f=((true=true) = (f=f));
    g:=f;
    Put(f);
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
    Put(f=g);
    Put(f*g);
    Put(g);

end TurboMegaTest;