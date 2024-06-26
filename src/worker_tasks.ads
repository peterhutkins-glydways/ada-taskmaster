--  Worker_Tasks.ads

--  All the interesting things that parameterize the Worker_Task
--  are in the Worker_Configs package.
with Worker_Configs;

package Worker_Tasks is
   --  Takes a (constant reference to a) configuration
   type Worker_Config_Access is access constant Worker_Configs.Worker_Config;

   task type Worker_Task (Config : Worker_Config_Access);
end Worker_Tasks;
