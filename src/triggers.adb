-- Triggers.adb
package body Triggers is
   protected body Task_Trigger is
      procedure Activate is
      begin
         Active := True;
      end Activate;

      entry Wait when Active is
      begin
         Active := False;  -- Auto-reset on trigger
      end Wait;
   end Task_Trigger;
end Triggers;