-- busy_wait.adb
with Ada.Real_Time;

package body Busy_Wait is
   procedure Busy_Wait is
      Start_Time     : Ada.Real_Time.Time;
      End_Time       : Ada.Real_Time.Time;
      Current_Time   : Ada.Real_Time.Time;
      Pause_Duration : constant Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds (1_000);
   begin
      Start_Time := Ada.Real_Time.Clock;
      End_Time   := Ada.Real_Time."+" (Start_Time, Pause_Duration);
      loop
         Current_Time := Ada.Real_Time.Clock;
         exit when Ada.Real_Time.">" (Current_Time, End_Time);
      end loop;
   end Busy_Wait;
end Busy_Wait;
