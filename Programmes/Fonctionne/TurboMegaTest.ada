with Ada.Text_IO; use Ada.Text_IO;

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
    Put(a); -- 550
    Put(b); -- 1
    Put(c); -- 55
    Put(d); -- 605
    Put(e); -- 605

    a := 2;
    a := a+ -1;
    b := 2;
    b := -1 + b;
    Put(a); -- 1
    Put(b); -- 1

    a:=2457;
    b:=76;
    c:=a/b;
    d:=10930/b/c;
    e:=50/2;
    Put(a); -- 2457
    Put(b); -- 76
    Put(c); -- 32
    Put(d); -- 4
    Put(e); -- 25

    a:=2;
    b:=3;
    c:=a*b;
    d:=b*a;
    e:=a*50;
    Put(a); -- 2
    Put(b); -- 3
    Put(c); -- 6
    Put(d); -- 6
    Put(e); -- 100

    a:=5;
    b:=2;
    c:= a rem b;
    d:= b rem a;
    Put(a); -- 5
    Put(b); -- 2
    Put(c); -- 1
    Put(d); -- 2

    a:= 2;
    b:= 3;
    c:= 4;
    d:= b+c*a*(a+ b rem c);
    Put(a); -- 2
    Put(b); -- 3
    Put(c); -- 4
    Put(d); -- 43

    Put(3=3); -- true
    Put(3/=3); -- false
    Put(false=false); -- true
    Put((false=false)/=(true=true)); -- false
    f:=true;
    f:= f=((true=true) = (f=f));
    g:=f;
    Put(f); -- true
    Put(2<=3); -- true
    Put(3>=2); -- true
    Put(2>=2); -- true
    Put(2<=2); -- true
    Put(2>=3); -- false
    Put(2<3); -- true
    Put(2>3); -- false
    Put(2=3); -- false
    Put(2/=3); -- true
    Put(2=2); -- true
    Put(2/=2); -- false
    Put(f=g); -- true
    Put(f*g); -- true
    Put(g); -- true

end TurboMegaTest;