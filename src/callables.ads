--  Callables.ads

--  Define a generic callable type that can be used to store calls
--  for Ada, C, and C++ procedures.
--
--  Under the Ravenscar profile, dynamic dispatching is not allowed, so
--  we will make due with polymorphism.
--  Below, we define a generic package that can be used to store any kind of
--  callable that we may want to create.

generic
   type Procedure_Type is access procedure;

package Callables is
   --  limited = can't be copied
   --  private = internal details are hidden from outside
   type Callable_Type is limited private;

   --  Want to make a Callable?  Call this factory function.
   function Create_Callable (Proc : Procedure_Type, Spec : Specification_Type) return Callable_Type;
   --  function Create_Callable (Proc : Procedure_Type; Spec : Specification_Type := null) return Callable_Type;

   --  Procedure to execute the callable
   procedure Execute (C : Callable_Type; Args : Specification_Type);

private
   type Callable_Type is record
      Proc : Procedure_Type;
      Spec : Specification_Type := null;
   end record;
end Callables;
