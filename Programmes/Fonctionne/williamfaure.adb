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
   Sum_For:Integer := 0;
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

   if Sum_For = Sum_While then
      Sum_While := Sum_While + J;
      Sum_For := 1+2-3*4/5;
      Sum_For := factorial(5,4);
   elsif Sum_For > Sum_While then
      Sum_While := Sum_While + J;
   elsif Sum_For > Sum_While then
      Sum_While := Sum_While + J;
   else
      Sum_While := Sum_While + J;
   end if;


   --put(Sum_For);
   --put(Sum_While);
end williamfaure;
