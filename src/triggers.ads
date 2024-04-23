--  Triggers.ads
package Triggers
   with SPARK_Mode
is
   protected type Task_Trigger is
      procedure Activate;
      entry Wait;
   private
      Active : Boolean := False;
   end Task_Trigger;
end Triggers;
