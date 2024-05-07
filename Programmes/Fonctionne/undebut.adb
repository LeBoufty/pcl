with Ada.Text_IO ; use Ada.Text_IO ;

procedure unDebut is

    choix : integer ;

    function aireRectangle(larg : integer; long : integer) return integer is
    aire: integer;
    aire: integer;
    begin
        aire := larg * long ;
        return aire ;
    end aireRectangle ;

    function aireRectangle(larg : integer; long : integer) return integer is
    aire: integer;
    aire: integer;
    begin
        aire := larg * long ;
        return aire ;
    end aireRectangle ;


    procedure testProcedure(bo : integer) is

        function aireRectangle(larg : integer; long : integer) return integer is
        aire: integer;
        aire: integer;
        begin
            aire := larg * long ;
            choix := 0;
            return aire ;
        end aireRectangle ;

    begin
        bo := bo + 1;
        return 1;
    end testProcedure;

    function perimetreRectangle(larg : integer; long : integer) return integer is
        aire : integer;
        choix: 
        procedure testProcedure(bo : integer) is
        begin
            bo := bo + 1;
            return 1;
        end testProcedure;

    begin
        aire := larg*2 + long*2;
        return aire ;
    end perimetreRectangle;
    

    -- VARIABLES

valeur : integer ;
test : integer ;

-- PROCEDURE PRINCIPALE
begin
    testProcedure(1);
    choix := character'val('a');
    valeur := aireRectangle(2, 3);
    choix := valeur + choix;
    for j in 1..2 loop
        for j in 1..2 loop
            valeur := aireRectangle(j, 2);
        end loop;
        perimetreRectangle(j, 2);
    end loop;
    choix := 1;

    if choix = 1 or
     else choix = 2 
        then valeur := perimetreRectangle(2, 3) ;
            put(valeur) ;
        else valeur := aireRectangle(2, 3) ;
            --put(valeur) ;
    end if;
end unDebut ;

