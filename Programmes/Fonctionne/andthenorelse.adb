with Ada.Text_IO; use Ada.Text_IO;

procedure andthenorelse is
   -- Declare a variable
   Age : Integer;

begin
   -- Prompt the user for input
   Put("Enter your age: ");
   Get(Item => Age);

   -- Check if the entered age is within a valid range using "and then"
   if Age >= 18 and then Age <= 65 then
      --Put_Line("You are eligible for the job.");
      put('y');
   else
      -- Use "or else" to check another condition
      if Age < 18 or else Age > 100 then
         --Put_Line("Invalid age.");
         put('n');
      else
         --Put_Line("You are not eligible for the job.");
         put('N');
      end if;
   end if;
end andthenorelse;
