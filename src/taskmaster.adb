
with Ada.Text_IO; use Ada.Text_IO;
with Task_Manager; use Task_Manager;

procedure Taskmaster is
begin
   Put_Line ("This is the first line from Ada.");

   Task_Manager.Task1_Trigger.Activate;

   Put_Line ("The main task is about to loop forever. Press Ctrl-C to end.");
   --  Implementation note: "Restriction (No_Task_Termination)" doesn't
   --  actually require that no tasks terminate, but does not define
   --  what happens when they do.
   --  Unless you have an explicit loop in the main task, as below, the program
   --  may non-deterministically terminate (possibly before any other tasks
   --  get a chance to run) or loop within finalize.
   loop
      null;
   end loop;
end Taskmaster;
