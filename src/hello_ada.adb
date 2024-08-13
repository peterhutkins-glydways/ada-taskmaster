with Ada.Text_IO; use Ada.Text_IO;

procedure Hello_Ada is
begin
   Put_Line ("Hello world from Ada");
   -- raise Program_Error; --  This should trigger the last chance handler.
end Hello_Ada;