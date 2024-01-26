with Ada.Text_IO; use Ada.Text_IO;

-- Main program
procedure recordiii is
   -- Define a record type
   type Person_Record is record
      Name    : Caractere;
      Age     : Integer;
      Address : Caractere;
   end record;

   type AgePersonne is record
      Ageenquestion : Integer;
   end record;

   -- Declare variables of the record type
   Person1 : Person_Record;
   Person2 : Person_Record;
begin
   -- Initialize values for Person1
   Person1.Name := 'J';
   Person1.Age := -30 - 5 + 4;
   Person1.Address := 'e';
   Person1.Age := Person1.Age rem 2;


   -- Display information about Person1
   --Put_Line('Person 1:');
   --Put_Line('Name: ' & Person1.Name);
   --Put_Line('Age: ' & Integer'Image(Person1.Age));
   --Put_Line('Address: ' & Person1.Address);

   -- Initialize values for Person2
   Person2.Name := 'h';
   Person2.Age := 25;
   Person2.Address := 'l';

   -- Display information about Person2
   --Put_Line('Person 2:');
   --Put_Line('Name: ' & Person2.Name);
   --Put_Line('Age: ' & Integer'Image(Person2.Age));
   --Put_Line('Address: ' & Person2.Address);
end recordiii;
