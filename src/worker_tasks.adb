--  Worker_Tasks.adb
with Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;
with Worker_Configs; use Worker_Configs;
with Callables_Container; use Callables_Container;
with Triggers;            use Triggers;

--  Worker_Tasks.adb
package body Worker_Tasks is
   task body Worker_Task is
      Task_Start : Ada.Real_Time.Time;
      Deadline   : Ada.Real_Time.Time;
      Task_Time_Limit_Overrun : Boolean := False;
      Task_Name : constant String := Config.Name.all;
      Init_Call : constant access Callable_Type := Config.Init_Callable;
      Triggered_Call : constant access Callable_Type := Config.Triggered_Callable;
      Trigger : constant access Task_Trigger := Config.Trigger;
      Time_Limit : constant Ada.Real_Time.Time_Span := Config.Time_Limit;
   begin
      --  Execute initialization callable
      --  Ada learning note: all this ".all" stuff is to dereference the access
      if Init_Call /= null then
         Execute (Init_Call.all);
      end if;

      loop
         Trigger.Wait;  --  block here
         Task_Start := Ada.Real_Time.Clock;
         Deadline := Ada.Real_Time."+" (Task_Start, Time_Limit);

         --  Execute triggered callable
         if Triggered_Call /= null then
            Execute (Triggered_Call.all);
         end if;

         --  Check if the triggered callable has completed within the deadline
         if Ada.Real_Time.">"(Ada.Real_Time.Clock, Deadline) then
            Task_Time_Limit_Overrun := True;
         else
            Task_Time_Limit_Overrun := False;
         end if;

         if Task_Time_Limit_Overrun then
            --  Report timeout or handle accordingly. e.g., log.
            Put ("Time_Limit_Overrun on task " & Task_Name);
         end if;
      end loop;
   end Worker_Task;

end Worker_Tasks;
