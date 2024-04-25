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

--  Statically declares configurations and tasks. This allows:
--    * resource reservation
--    * avoidance of dynamic behaivor
--    * memory determinism

package Task_Manager is
   --  Expose the triggers for the tasks so that others can use it.
   Task1_Trigger : aliased Triggers.Task_Trigger;
   Task2_Trigger : aliased Triggers.Task_Trigger;
   Task3_Trigger : aliased Triggers.Task_Trigger;

   Task1_Call : constant access Callables_Container.Callable_Type :=
      new Callables_Container.Callable_Type'(
         Kind => Callables_Container.C_Kind,
         C_Call => C_Callables.Create_Callable (
            Hello_Cpp_Wrapper.Say_Hello_From_Cpp'Access)
         );
   Task2_Call : constant access Callables_Container.Callable_Type :=
      new Callables_Container.Callable_Type'(
         Kind => Callables_Container.Ada_Kind,
         Ada_Call => Ada_Callables.Create_Callable (
            sleepy_c.stub'Access)
      );
   Task3_Call : constant access Callables_Container.Callable_Type :=
      new Callables_Container.Callable_Type'(
         Kind => Callables_Container.Ada_Kind,
         Ada_Call => Ada_Callables.Create_Callable (
            Hello_Ada'Access)
      );

private
   --  Keep the task specifics private to avoid direct access.
   Task1_Config : aliased constant Worker_Config := Create_Config (
      Name => "Hello_C++_Task",
      Init_Callable => null,
      Triggered_Callable => Task1_Call,
      Trigger => Task1_Trigger'Access,
      Timeout => Ada.Real_Time.Seconds (1)
   );
   Worker1 : Worker_Task (Config => Task1_Config'Access);

   Task2_Config : aliased constant Worker_Config := Create_Config (
      Name => "Sleepy_Task",
      Init_Callable => null,
      Triggered_Callable => Task2_Call,
      Trigger => Task2_Trigger'Access,
      Timeout => Ada.Real_Time.Seconds (5)
   );
   Worker2 : Worker_Task (Config => Task2_Config'Access);

   Task3_Config : aliased constant Worker_Config := Create_Config (
      Name => "Hello_Ada_Task",
      Init_Callable => null,
      Triggered_Callable => Task3_Call,
      Trigger => Task3_Trigger'Access,
      Timeout => Ada.Real_Time.Seconds (1)
   );
   Worker3 : Worker_Task (Config => Task3_Config'Access);


end Task_Manager;
