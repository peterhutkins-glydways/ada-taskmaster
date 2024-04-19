--  Triggers.ads
package Triggers is
   protected type Task_Trigger is
      procedure Activate;
      entry Wait;
   private
      Active : Boolean := False;
   end Task_Trigger;
end Triggers;
