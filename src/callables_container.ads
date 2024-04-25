--  Callables_Container.ads
with Ada_Callables;
with C_Callables;

package Callables_Container is
   --  enumerate the Kinds of callables we can contain
   type Callable_Kind is (Ada_Kind, C_Kind);

   type Callable_Type (Kind : Callable_Kind := Ada_Kind) is record
      case Kind is
         when Ada_Kind =>
            Ada_Call : Ada_Callables.Callable.Callable_Type;
         when C_Kind =>
            C_Call : C_Callables.Callable.Callable_Type;
      end case;
   end record;

   procedure Execute (C : Callable_Type);
end Callables_Container;
