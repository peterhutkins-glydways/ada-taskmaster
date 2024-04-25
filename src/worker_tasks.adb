--  Worker_Tasks.adb
with Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;
with Worker_Configs; use Worker_Configs;
with Callables_Container; use Callables_Container;

--  Worker_Tasks.adb
package body Worker_Tasks is

   task body Worker_Task is
      Task_Start : Ada.Real_Time.Time;
      Deadline   : Ada.Real_Time.Time;
      Task_Overrun : Boolean := False;
      Init_Call : constant access Callable_Type :=
         Get_Init_Callable (Config.all);
      Triggered_Call : constant access Callable_Type :=
         Get_Triggered_Callable (Config.all);
   begin
      --  Ada learning note: all this ".all" stuff is to dereference the access
      --  Execute initialization callable
      if Init_Call /= null then
         Execute (Init_Call.all);
      end if;

      loop
         Get_Trigger (Config.all).Wait;  --  block here
         Task_Start := Ada.Real_Time.Clock;
         Deadline := Ada.Real_Time."+"(Task_Start, Get_Timeout (Config.all));

         --  Execute triggered callable
         if Triggered_Call /= null then
            Execute (Triggered_Call.all);
         end if;

         --  Check if the triggered callable has completed within the deadline
         if Ada.Real_Time.">"(Ada.Real_Time.Clock, Deadline) then
            Task_Overrun := True;
         else
            Task_Overrun := False;
         end if;

         if Task_Overrun then
            --  Report timeout or handle accordingly. e.g., log.
            Put ("Task overrun detected on task " & Get_Name (Config.all));
         end if;
      end loop;
   end Worker_Task;

end Worker_Tasks;
