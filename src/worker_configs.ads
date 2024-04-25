--  Worker_Configs.ads
with Ada.Strings.Bounded;
with Ada.Real_Time;       use Ada.Real_Time;
with Triggers;            use Triggers;
with Callables_Container; use Callables_Container;

package Worker_Configs
--   with SPARK_Mode
is
   type Worker_Config is private;

   --  Factory method to create a new Worker_Config
   function Create_Config (
      Name                 : String;
      Init_Callable        : access Callable_Type := null;
      Triggered_Callable   : access Callable_Type := null;
      Trigger : access Task_Trigger;
      Timeout : Time_Span
   ) return Worker_Config;

   --  Accessors for Worker_Config
   function Get_Name (Config : Worker_Config) return String;
   function Get_Init_Callable (Config : Worker_Config)
                               return access Callable_Type;
   function Get_Triggered_Callable (Config : Worker_Config)
                                    return access Callable_Type;
   function Get_Trigger (Config : Worker_Config) return access Task_Trigger;
   function Get_Timeout (Config : Worker_Config) return Time_Span;

private
   --  Bounded string type for the Worker_Config name.
   package Task_Name_String is
      new Ada.Strings.Bounded.Generic_Bounded_Length (Max => 15);
   use Task_Name_String;

   --  Internal storage for the Worker_Config
   type Worker_Config is record
      Name               : Bounded_String;
      Init_Callable      : access Callable_Type;
      Triggered_Callable : access Callable_Type;
      Trigger            : access Task_Trigger;
      Timeout            : Time_Span;
   end record;
end Worker_Configs;
