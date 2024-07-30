--  Worker_Configs.ads
with Ada.Real_Time;       use Ada.Real_Time;
with Triggers;            use Triggers;
with Callables_Container; use Callables_Container;

package Worker_Configs
--   with SPARK_Mode
is
   type Name_Acc is access constant String;
   type Worker_Config is record
      Name               : Name_Acc;
      Init_Callable      : access Callable_Type;
      Triggered_Callable : access Callable_Type;
      Trigger            : access Task_Trigger;
      Time_Limit         : Time_Span;
   end record;

end Worker_Configs;
