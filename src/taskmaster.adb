
with Ada.Text_IO; use Ada.Text_IO;
with Task_Manager; use Task_Manager;
with Busy_Wait; use Busy_Wait;

procedure Taskmaster is
begin
   Put_Line ("Ada main task started.");
   Put_Line ("Ada main task is about to loop forever. Press Ctrl-C to end.");
   loop
      Task_Manager.Task1_Trigger.Activate;   -- Hello World from C++
      Task_Manager.Task2_Trigger.Activate;   -- Hello World from Ada
      Task_Manager.Task3_Trigger.Activate;   -- Sleepy_Task in C
      Task_Manager.Task4_Trigger.Activate;   -- Exception_Task in C
      Busy_Wait.Busy_Wait;
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
