with Ada.Text_IO ; use Ada.Text_IO ;

procedure test_sem is

-- Fonction incorrecte, n'a pas le même nom au début et à la fin
    function uneFonction (var_1 : Integer) return Integer is
    begin
        return var_1 ;
    end uneFonctio ;

-- Fonction incorrecte avec le même nom
    function uneFonction (var_1 : Integer) return Integer is
    begin
        return var_1 ;
    end uneFonction ;

-- Procédure incorrecte, comporte un return
    procedure uneProcedure (var_1 : Integer) is
    begin
        for i in 1..var_1 loop
            return 1 ;
        end loop ;
    end uneProcedure ;

-- VARIABLES
    var_1 : Integer ;
    char_1 : char;

-- Deux variables avec le même nom
    var_1 : Integer ;


-- PROCEDURE PRINCIPALE
begin

    var_1 := uneFonction(1) ;
    var_1 := uneProcedure(1) ;

    -- Variable non initialisée
    var_2 := 2 ;
    var_1 := var_1 + var_2 ;

    -- Type incorrect
    var_1 := var_1 + char_1 ;
    var_1 := char_1 ;

    -- Opération incorrecte
    var_1 := var_1 + '2' ;


end test_sem ;

