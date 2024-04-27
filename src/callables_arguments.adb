--   Callables_Arguments.adb
with Ada.Text_IO; use Ada.Text_IO;
with Callables_Argument; use Callables_Argument;

package body Callables_Arguments is
   procedure Display_Args (Data : Args) is
   begin
      for E of Data loop
         Put ("Arg Name: " & Arg_Name_String.To_String(E.Arg_Name) & " - ");
         case E.Kind is
            when Int =>
               Put_Line ("Integer: " & Integer'Image(E.Int_Value));
            when Str =>
               Put_Line ("String: " & Arg_Value_String.To_String(E.Str_Value));
         end case;
      end loop;
   end Display_Args;
end Callables_Arguments;
