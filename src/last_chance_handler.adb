-- last_chance_handler.adb
-- Solution borrowed from :
--  https://stackoverflow.com/questions/47275867/printing-the-exception-message-in-an-ada-last-chance-handler
--  https://wiki.osdev.org/Ada_Bare_Bones#Last_chance_handler

with GNAT.IO;
with System.Storage_Elements;

procedure Last_Chance_Handler (Source_Location : System.Address; Line : Integer) is
   use System.Storage_Elements; -- make "+" visible for System.Address

   pragma Style_Checks ("-s"); -- suppress "subprogram body has no previous spec" for internal function
   function Peek (Addr : System.Address) return Character is
      C : Character with Address => Addr;
   begin
      return C;
   end Peek;

   A : System.Address := Source_Location;
begin
   -- Put_Line("Detail :" & Address_To_String(Source_Location));
   GNAT.IO.Put ("line :");
   GNAT.IO.Put (Line); -- avoid the secondary stack for Line'Image
   GNAT.IO.New_Line;
   while Peek (A) /= ASCII.NUL loop
      GNAT.IO.Put (Peek (A));
      A := A + 1;
   end loop;
   GNAT.IO.New_Line;

   loop
      null;
   end loop;
end Last_Chance_Handler;
