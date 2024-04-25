with Callables;
package Ada_Callables is
   type Ada_Procedure is access procedure;

   --  Instantiate the generic package for Ada procedures
   package Callable is new Callables (Ada_Procedure);

   --  If a factory function is needed to create instances of Callable_Type:
   function Create_Callable (Proc : Ada_Procedure)
      return Callable.Callable_Type
      renames Callable.Create_Callable;

   --  Expose the Execute procedure for external use.
   procedure Execute (C : Callable.Callable_Type)
      renames Callable.Execute;

end Ada_Callables;
