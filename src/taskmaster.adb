pragma Profile (Ravenscar);

with Ada.Text_IO; use Ada.Text_IO;
with Task_Manager; use Task_Manager;

procedure Taskmaster is
begin

   Task_Manager.Task1_Trigger.Activate;

   Put_Line ("This message is from Ada.");
end Taskmaster;
