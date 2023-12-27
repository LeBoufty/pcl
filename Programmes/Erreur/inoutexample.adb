-- Missing use

with Ada.Text_IO;

procedure InOutExample is
   -- Procedure with in out parameter
   procedure ModifyNumber(InOutParam : in out Integer) is
   begin
      InOutParam := InOutParam * 2;
   end ModifyNumber;

   -- Main program
   Number : Integer := 10;

begin
   put("Original number: ");
   put(Number'Image);
   --New_Line;

   ModifyNumber(Number);  -- Calling the procedure with in out parameter

   put("Modified number: ");
   put(Number'Image);
   --New_Line;
end InOutExample;
