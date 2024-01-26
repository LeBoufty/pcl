with Ada.Text_IO; use Ada.Text_IO;

procedure williamfaure is

   function factorial(N:Integer; n:Integer) return Integer is
      Result:Integer := 1;
   begin
      for I in 1..N loop
         Result := Result * I;
      end loop;
      return Result;
   end factorial;
   Sum_For:Integer;
   Sum_While:Integer := 0;
   J : Integer := 1;

begin
   for I in reverse 1..10 loop
      Sum_For := Sum_For + I;
   end loop;

   while J <= 10 loop
      Sum_While := Sum_While + J;
      J := J + 1;
   end loop;

   --put(Sum_For);
   --put(Sum_While);
end williamfaure;
