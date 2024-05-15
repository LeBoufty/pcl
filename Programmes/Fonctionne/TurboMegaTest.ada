with Ada.Text_IO; use Ada.Text_IO;

procedure TurboMegaTest is

    a: Integer := 1;
    b: Integer := 2;
    c: Integer := 3;
    d: Integer; 
    e: Integer := 5;
    f: Boolean;
    g: Boolean := true;

    function fonction1(a: Integer; b: Integer) return Integer is
    begin
        return a+b;
    end fonction1;

    procedure procedure1(a: Integer; b: Integer) is
    begin
        Put(a+b);
    end procedure1;

    function fonction_recurive(a: Integer) return Integer is
    begin
        if a = 0 then
            return 0;
        else
            return a + fonction_recurive(a-1);
        end if;
        return 0;
    end fonction_recurive;

    function fonction_recurive2(a: Integer; b: Integer; c: Integer) return Integer is
            
        d : Integer := 1;
        
        function fonction_recurive3(a: Integer; b: Integer; c: Integer) return Integer is
        
            d : Integer := 2;

            begin
                if c = 0 then
                    return 0;
                else
                    return 1+fonction_recurive3(a,b,c-1);
                end if;
                return d;
            end fonction_recurive3;
        begin
            return 1+fonction_recurive3(a,b,c);
        end fonction_recurive2;

    function for_test(a: Integer; b: Integer) return Integer is

        res : Integer := 0;

        begin
            for i in a..b loop
                res := res + i;
            end loop;
            return res;
        end for_test;

    function while_test(a: Integer; b: Integer) return Integer is
    
            res : Integer := 0;
            i : Integer := a;
    
            begin
                while i <= b loop
                    res := res + i;
                    i := i + 1;
                end loop;
                return res;
            end while_test;

    function for_reverse_test(a: Integer; b: Integer) return Integer is

        res : Integer := 0;

        begin
            for i in reverse a..b loop
                res := res + i;
            end loop;
            return res;
        end for_reverse_test;

    function for_in_for(a: Integer; b: Integer) return Integer is

        res : Integer := 0;

        begin
            for i in a..b loop
                for j in a..b loop
                    res := res + i + j;
                end loop;
            end loop;
            return res;
        end for_in_for;

    function for_in_while(a: Integer; b: Integer) return Integer is
    
            res : Integer := 0;
            i : Integer := a;
            k : Integer := 0;

            begin
                for i in a..b loop
                    while k <= b loop
                        res := res + i;
                        k := k + 1; 
                end loop;
            end loop;
            return res;
            end for_in_while;

    function for_in_for_in_for_in_for(a: Integer; b: Integer) return Integer is

        res : Integer := 0;

        begin
            for i in a..b loop
                for j in a..b loop
                    for k in a..b loop
                        for l in a..b loop
                            res := res + i + j + k + l;
                        end loop;
                    end loop;
                end loop;
            end loop;
            return res;
        end for_in_for_in_for_in_for;
begin
    Put('a');
    a:= 1;
    b:= a + 1 - 1;
    c:=2;
    c:= 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10;
    a:= c + c + c + c + c + c + c + c + c + c;
    d:=a+c;
    e:=c+a;
    Put(a=550); -- 550
    Put(b=1); -- 1
    Put(c=55); -- 55
    Put(d=605); -- 605
    Put(e=605); -- 605

    Put('b');
    a := 2;
    a := a+ -1;
    b := 2;
    b := -1 + b;
    Put(a=1); -- 1
    Put(b=1); -- 1

    Put('c');
    a:=2457;
    b:=76;
    c:=a/b;
    d:=10930/b/c;
    e:=50/2;
    Put(a=2457); -- 2457
    Put(b=76); -- 76
    Put(c=32); -- 32
    Put(d=4); -- 4
    Put(e=25); -- 25

    Put('d');
    a:=2;
    b:=3;
    c:=a*b;
    d:=b*a;
    e:=a*50;
    Put(a=2); -- 2
    Put(b=3); -- 3
    Put(c=6); -- 6
    Put(d=6); -- 6
    Put(e=100); -- 100

    Put('e');
    a:=5;
    b:=2;
    c:= a rem b;
    d:= b rem a;
    Put(a=5); -- 5
    Put(b=2); -- 2
    Put(c=1); -- 1
    Put(d=2); -- 2

    Put('f');
    a:= 2;
    b:= 3;
    c:= 4;
    d:= b+c*a*(a+ b rem c);
    Put(a=2); -- 2
    Put(b=3); -- 3
    Put(c=4); -- 4
    Put(d=43); -- 43

    Put('g');
    Put(3=3); -- true
    Put(false = (3/=3)); -- false
    Put(false=false); -- true
    Put(false = ((false=false)/=(true=true))); -- false
    f:=true;
    f:= f=((true=true) = (f=f));
    g:=f;
    Put(f); -- true
    Put(a<=b); -- true
    Put(b>=a); -- true
    Put(a>=a); -- true
    Put(a<=a); -- true
    Put((a>=b) = false); -- false
    Put(a<b); -- true
    Put(false = (a>b)); -- false
    Put(false = (a=b)); -- false
    Put(a/=b); -- true
    Put(a=a); -- true
    Put(false = (a/=a)); -- false
    Put(f=g); -- true
    Put(f*g); -- true
    Put(g); -- true

    Put('h');
    Put(fonction1(1,2) =3); -- 3
    a := -1;
    b := 2;
    procedure1(a,b); -- 1
    Put(fonction_recurive(5) =15); -- 15
    Put(fonction_recurive2(1,2,3) =4); -- 4
    Put(for_test(1,10) =55); -- 55
    Put(while_test(1,10) =55); -- 55
    Put(for_reverse_test(1,10) =55); -- 55
    Put(for_in_for(1,5) = 150); -- 150 
    Put(for_in_while(1,10) =11); -- 11
    Put(for_in_for_in_for_in_for(1,2) =96); -- 96

end TurboMegaTest;