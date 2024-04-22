--  Worker_Configs.adb
package body Worker_Configs is
   function Create_Config
     (Name : String;
      Init_Callable : Procedure_Access := null;
      Triggered_Callable : Procedure_Access := null;
      Trigger : access Task_Trigger; Timeout : Time_Span) return Worker_Config
   is
   begin
      return
        (Name => To_Bounded_String (Name),
         Init_Callable => Init_Callable,
         Triggered_Callable => Triggered_Callable,
         Trigger => Trigger,
         Timeout => Timeout);
   end Create_Config;

   function Get_Name (Config : Worker_Config) return String is
   begin
      return To_String (Config.Name);
   end Get_Name;
   pragma Inline (Get_Name);

   function Get_Init_Callable (Config : Worker_Config) return Procedure_Access
   is
   begin
      return Config.Init_Callable;
   end Get_Init_Callable;
   pragma Inline (Get_Init_Callable);

   function Get_Triggered_Callable
     (Config : Worker_Config) return Procedure_Access
   is
   begin
      return Config.Triggered_Callable;
   end Get_Triggered_Callable;
   pragma Inline (Get_Triggered_Callable);

   function Get_Trigger (Config : Worker_Config) return access Task_Trigger is
   begin
      return Config.Trigger;
   end Get_Trigger;
   pragma Inline (Get_Trigger);

   function Get_Timeout (Config : Worker_Config) return Time_Span is
   begin
      return Config.Timeout;
   end Get_Timeout;
   pragma Inline (Get_Timeout);

end Worker_Configs;
