-- Callable.adb
package body Callable is
   procedure Execute_Procedure(Proc : Procedure_Type) is
   begin
      Proc.all;  -- Execute the procedure pointed to by Proc
   end Execute_Procedure;
end Callable;
