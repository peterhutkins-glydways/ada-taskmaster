--  Callables_Container.adb

package body Callables_Container is
   procedure Execute (C : Callable_Type) is
   begin
      case C.Kind is
         when Ada_Kind =>
            Ada_Callables.Callable.Execute (C.Ada_Call);
         when C_Kind =>
            C_Callables.Callable.Execute (C.C_Call);
      end case;
   end Execute;
end Callables_Container;
