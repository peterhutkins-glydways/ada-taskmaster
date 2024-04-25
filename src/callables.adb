--   Callables.adb

package body Callables is
   function Create_Callable (Proc : Procedure_Type) return Callable_Type is
   begin
      return (Proc => Proc);
   end Create_Callable;

   procedure Execute (C : Callable_Type) is
   begin
      C.Proc.all;  -- Execute the procedure
   end Execute;
end Callables;
