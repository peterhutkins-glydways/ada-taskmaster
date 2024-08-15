-- last_chance_handler.ads
-- According to the documentation, this is how you override the Last_Chance_Handler.
-- The Last_Chance_Handler is called by the runtime when an uncaught exception is raised.

with System;
procedure Last_Chance_Handler (Source_Location : System.Address; Line : Integer);
pragma Export (C, Last_Chance_Handler, "__gnat_last_chance_handler");
