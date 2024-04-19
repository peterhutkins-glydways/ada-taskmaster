-- Triggers.ads
package Triggers is
   protected type Task_Trigger is
      procedure Activate;
      entry Wait;
   private
      Active : Boolean := False;
   end Task_Trigger;

   -- Declare one static instance of Task_Trigger that never gets started.
   -- Used as a placeholder for tasks that are never triggered.
   Never_Triggered : Task_Trigger;
end Triggers;
