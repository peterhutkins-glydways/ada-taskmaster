--  c_callables.ads

with Callables;
package C_Callables is
   type C_Procedure is access procedure;
   pragma Convention (C, C_Procedure);

   --  Instantiate Callables with C_Procedure
   package Callable is new Callables (C_Procedure);

   --  Expose Create_Callable as part of C_Callables
   function Create_Callable (Proc : C_Procedure) return Callable.Callable_Type
      renames Callable.Create_Callable;

   --  Expose the Execute procedure for external use.
   procedure Execute (C : Callable.Callable_Type)
      renames Callable.Execute;

end C_Callables;
