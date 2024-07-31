
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time;
with Task_Manager; use Task_Manager;

procedure Taskmaster is

   -- Ravenscar prevents relative delays, so we can't use the 'delay' statement.
   -- Instead, we'll busy-wait for a while.
   procedure Busy_Wait is
      Start_Time : Ada.Real_Time.Time;
      End_Time : Ada.Real_Time.Time;
      Current_Time : Ada.Real_Time.Time;
      Pause_Duration : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds (1000);
   begin
      Start_Time := Ada.Real_Time.Clock;
      End_Time := Ada.Real_Time."+"(Start_Time, Pause_Duration);
      loop
         Current_Time := Ada.Real_Time.Clock;
         exit when Ada.Real_Time.">"(Current_Time, End_Time);
      end loop;
   end Busy_Wait;

begin
   Put_Line ("Ada main task started.");
   Put_Line ("Ada main task is about to loop forever. Press Ctrl-C to end.");
   loop
      Task_Manager.Task1_Trigger.Activate;   -- Hello World from C++
      Task_Manager.Task2_Trigger.Activate;   -- Hello World from Ada
      Task_Manager.Task3_Trigger.Activate;   -- Sleepy_Task in C
      Task_Manager.Task4_Trigger.Activate;   -- Exception_Task in C
      Busy_Wait;
   end loop;

   --  Implementation note: "Restriction (No_Task_Termination)" doesn't
   --  actually require that no tasks terminate, but does not define
   --  what happens when they do.
   --  Unless you have an explicit loop in the main task, as below, the program
   --  may non-deterministically terminate (possibly before any other tasks
   --  get a chance to run) or loop within finalize.
   --  loop
   --     null;
   --  end loop;
end Taskmaster;
