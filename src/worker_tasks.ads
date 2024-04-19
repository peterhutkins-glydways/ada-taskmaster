--  Worker_Tasks.ads
with Ada.Real_Time;
with Triggers;

package Worker_Tasks is
   type Procedure_Access is access procedure;
   --  Ensure the access type uses C calling convention.
   --  TODO: figure out how to overload so it can be used
   --    with Ada calling convention as well.
   pragma Convention (C, Procedure_Access);

   type Worker_Config is record
      Init_Callable     : Procedure_Access := null;
      Triggered_Callable : Procedure_Access := null;
      Trigger           : access Triggers.Task_Trigger;
      Timeout           : Ada.Real_Time.Time_Span;
   end record;

   type Worker_Config_Access is access constant Worker_Config;

   task type Worker_Task (Config : Worker_Config_Access);
end Worker_Tasks;
