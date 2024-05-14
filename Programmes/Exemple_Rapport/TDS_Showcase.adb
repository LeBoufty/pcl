with Ada.Text_IO ; use Ada.Text_IO ;

procedure TDS_Showcase is

    function fonction_A(parametre_A : Integer) return Integer is
        variable_A : Integer := 0;
    begin
        return variable_A + parametre_A;
    end fonction_A;

    procedure procedure_B(parametre_B : Integer) is
        variable_B : Integer := 0;

        function fonction_C(parametre_C : Integer) return Integer is
            variable_C : Integer := 0;
        begin
            return variable_C - parametre_C;
        end fonction_C;

    begin
        variable_B := fonction_A(parametre_B);
        variable_B := variable_B + fonction_C(parametre_B);
        put(variable_B);
    end procedure_B;
    
begin

    procedure_B(5);
    for i in 1..10 loop
        fonction_A(i);
        put(fonction_A(i));
    end loop;

end TDS_Showcase;