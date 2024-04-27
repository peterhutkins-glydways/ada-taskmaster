--   Callables_Arguments.adb
with Ada.Text_IO; use Ada.Text_IO;
with Callables_Argument; use Callables_Argument;

package body Callables_Arguments is
   procedure Display_Args (Data : Args) is
   begin
      for E of Data loop
         Put ("Arg Name: " & Name(E) & " - ");
         case Kind(E) is
            when Int =>
               Put_Line ("Integer: " & Integer'Image(Value(E)));
            when Str =>
               Put_Line ("String: " & Value(E));
         end case;
      end loop;
   end Display_Args;
end Callables_Arguments;
