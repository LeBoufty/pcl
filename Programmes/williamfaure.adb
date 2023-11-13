with Ada.Text_IO; use Ada.Text_IO;

procedure williamfaure is
   Sum_For:Integer := 0;
   Sum_While:Integer := 0;
begin
   for I in reverse 1..10 loop
      Sum_For := Sum_For + I;
   end loop;

   declare
      J : Integer := 1;
   begin
      while J <= 10 loop
         Sum_While := Sum_While + J;
         J := J + 1;
      end loop;
   end;

   Ada.Text_IO.Put_Line("Somme avec boucle for : " & Integer'Image(Sum_For));
   Ada.Text_IO.Put_Line("Somme avec boucle while : " & Integer'Image(Sum_While));
end williamfaure;
