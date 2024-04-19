--   Task_Manager.ads
with Worker_Tasks; use Worker_Tasks;
with Ada.Real_Time;
with Hello_Wrapper;
with Triggers;

package Task_Manager is
   --  Statically declare configurations and tasks. This allows:
   --    * resource reservation
   --    * avoidance of dynamic behaivor
   --    * memory determinism
   Task1_Callable1 : Procedure_Access :=
      Hello_Wrapper.Say_Hello_From_Cpp'Access;
   Task1_Trigger : aliased Triggers.Task_Trigger; -- creates Task_Trigger, too
   Task1_Config : aliased constant Worker_Config := (
      Init_Callable => null,
      Triggered_Callable => Task1_Callable1,
      Trigger => Task1_Trigger'Access,
      Timeout => Ada.Real_Time.Seconds (5)
   );

   Worker1 : Worker_Task (Config => Task1_Config'Access);

end Task_Manager;
