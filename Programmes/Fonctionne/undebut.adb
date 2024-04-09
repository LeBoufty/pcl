with Ada.Text_IO ; use Ada.Text_IO ;

procedure unDebut is

    function aireRectangle(larg : integer; long : integer) return integer is
    aire: integer;
    begin
        aire := larg * long ;
        return aire ;
    end aireRectangle ;

    function perimetreRectangle(larg : integer; long : integer) return integer is
    aire : integer;
    begin
        aire := larg*2 + long*2;
        return aire ;
    end perimetreRectangle;

    procedure testProcedure(bo : integer) is
    begin
        bo := bo;
    end testProcedure;

    -- VARIABLES
choix : integer ;
valeur : integer ;
test : integer ;

-- PROCEDURE PRINCIPALE
begin
    choix := 2;
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

