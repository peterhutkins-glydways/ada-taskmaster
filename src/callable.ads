-- Callable.ads
-- Meant as an intermediary definition between the wrapper and the calling task 
--  so that the task can call C, C++, Ada or any other procedure.
package Callable is
   -- Define a generic callable type
   generic
      type Procedure_Type is access procedure;
   procedure Execute_Procedure(Proc : Procedure_Type);
end Callable;
