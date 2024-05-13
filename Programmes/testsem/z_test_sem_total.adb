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

-- Fonction dans une fonction dans une fonction
    function lafonction (var_1 : Integer) return Integer is
        function lafonction2 (var_1 : Integer) return Integer is
            function lafonction3 (var_1 : Integer) return Integer is
            begin
                return var_1 ;
                lafonction3(1) ;
            end lafonction3 ;
        begin
            return var_1 ;
        end lafonction2 ;
    begin
        return var_1 ;
    end lafonction ;

-- Procédure incorrecte, comporte un return
    procedure uneProcedure (var_1 : Integer) is
    -- Deux variables avec le même nom
        var_2 : Integer ;
        var_2 : Integer ;
    -- Une variable avec le même nom qu'un paramètre
        var_1 : Integer ;
    begin
        -- Itirérateur ne peut pas être modifié ou utilisé dans les bornes
        for i in i..i loop
            i := i + 1 ;
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

    -- Fonction non définie
    var_1 := uneFonction2(1) ;

    -- Test and then
    if var_1 = 1 and then var_2 = 2 then
        var_1 := 1 ;
    end if ;

end test_sem ;

