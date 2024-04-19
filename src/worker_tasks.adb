--  Worker_Tasks.adb

package body Worker_Tasks is

   task body Worker_Task is
      Task_Start : Ada.Real_Time.Time;
      Deadline   : Ada.Real_Time.Time;
      Task_Overrun : Boolean := False;
   begin
      --  Execute initialization callable
      if Config.Init_Callable /= null then
         Config.Init_Callable.all;
      end if;

      loop
         Config.Trigger.Wait;  --  block here
         Task_Start := Ada.Real_Time.Clock;
         Deadline := Ada.Real_Time."+"(Task_Start, Config.Timeout);

         --  Execute triggered callable
         if Config.Triggered_Callable /= null then
            Config.Triggered_Callable.all;
         end if;

         --  Check if the triggered callable has completed within the deadline
         if Ada.Real_Time.">"(Ada.Real_Time.Clock, Deadline) then
            Task_Overrun := True;
         else
            Task_Overrun := False;
         end if;

         if Task_Overrun then
            --  Report timeout or handle accordingly. e.g. log.
            null;
         end if;

      end loop;
   end Worker_Task;

end Worker_Tasks;
