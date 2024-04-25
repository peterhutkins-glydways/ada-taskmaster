--  c_callables.ads
--  For use with either C or C++ callables.

with Callables;
package C_Callables is
   type C_Procedure is access procedure;
   pragma Convention (C, C_Procedure);

   --  Instantiate Callables with C_Procedure
   package Callable is new Callables (C_Procedure);

   --  Create_Callable is where we can create a callable from a C_Procedure.
   --  For now, this is a simple wrapper around Callable.Create_Callable,
   --  but it could be used to set up additional context or state.
   function Create_Callable (Proc : C_Procedure) return Callable.Callable_Type
      renames Callable.Create_Callable;

   --  Execute is where we can run the C_Procedure.
   --  For now, this is a simple wrapper around Callable.Execute,
   --  but it could be used to set up additional context or state.
   procedure Execute (C : Callable.Callable_Type)
      renames Callable.Execute;

end C_Callables;
