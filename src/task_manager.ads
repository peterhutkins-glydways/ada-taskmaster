--   Task_Manager.ads
with Worker_Tasks; use Worker_Tasks;
with Ada.Real_Time;
with Worker_Configs; use Worker_Configs;
with Triggers;
with Callables_Container; use Callables_Container;
with C_Callables;
with Ada_Callables;

--  include the Procedures that we wish to call via Trigger
with Hello_Cpp_Wrapper;
with sleepy_c;
with Hello_Ada;
with Exception_C_Wrapper;

--  Statically declares configurations and tasks. This allows:
--    * resource reservation
--    * avoidance of dynamic behaivor
--    * memory determinism
--  TODO: hide specifics of task configurations in the body, so they are not public.

package Task_Manager is
   Task1_Name : aliased String := "Hello_C++_Task";
   Task1_Trigger : aliased Triggers.Task_Trigger;
   Task1_Call : aliased Callables_Container.Callable_Type :=
      Callables_Container.Callable_Type'(
         Kind => Callables_Container.C_Kind,
         C_Call => C_Callables.Create_Callable (
            Hello_Cpp_Wrapper.Say_Hello_From_Cpp'Access)
         );
   Task1_Config : aliased constant Worker_Config := Worker_Config'(
      Name               => Task1_Name'Access,
      Init_Callable      => null,
      Triggered_Callable => Task1_Call'Access,
      Trigger            => Task1_Trigger'Access,
      Time_Limit         => Ada.Real_Time.Seconds (1)
   );

   Task2_Name : aliased constant String := "Sleepy_Task";
   Task2_Trigger : aliased Triggers.Task_Trigger;
   Task2_Call : aliased Callables_Container.Callable_Type :=
      Callables_Container.Callable_Type'(
         Kind => Callables_Container.Ada_Kind,
         Ada_Call => Ada_Callables.Create_Callable (
            sleepy_c.stub'Access)
      );
   Task2_Config : aliased constant Worker_Config := Worker_Config'(
      Name => Task2_Name'Access,
      Init_Callable      => null,
      Triggered_Callable => Task2_Call'Access,
      Trigger            => Task2_Trigger'Access,
      Time_Limit         => Ada.Real_Time.Milliseconds (1000)
   );

   Task3_Name : aliased constant String := "Hello_Ada_Task";
   Task3_Trigger : aliased Triggers.Task_Trigger;
   Task3_Call : aliased Callables_Container.Callable_Type :=
      Callables_Container.Callable_Type'(
         Kind => Callables_Container.Ada_Kind,
         Ada_Call => Ada_Callables.Create_Callable (
            Hello_Ada'Access)
      );
   Task3_Config : aliased constant Worker_Config := Worker_Config'(
      Name               => Task3_Name'Access,
      Init_Callable      => null,
      Triggered_Callable => Task3_Call'Access,
      Trigger            => Task3_Trigger'Access,
      Time_Limit         => Ada.Real_Time.Seconds (1)
   );

   Task4_Name : aliased constant String := "C Exception Task";
   Task4_Trigger : aliased Triggers.Task_Trigger;
   Task4_Call : aliased Callables_Container.Callable_Type :=
      Callables_Container.Callable_Type'(
         Kind => Callables_Container.C_Kind,
         C_Call => C_Callables.Create_Callable (
            Exception_C_Wrapper.cause_exception'Access)
      );
   Task4_Config : aliased constant Worker_Config := Worker_Config'(
      Name               => Task4_Name'Access,
      Init_Callable      => null,
      Triggered_Callable => Task4_Call'Access,
      Trigger            => Task4_Trigger'Access,
      Time_Limit         => Ada.Real_Time.Seconds (1)
   );
private
   --  Keep the task private to avoid direct access.
   Worker1 : Worker_Task (Config => Task1_Config'Access);
   Worker2 : Worker_Task (Config => Task2_Config'Access);
   Worker3 : Worker_Task (Config => Task3_Config'Access);
   Worker4 : Worker_Task (Config => Task4_Config'Access);

end Task_Manager;
