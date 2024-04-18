pragma Profile (Ravenscar);

with Ada.Text_IO; use Ada.Text_IO;
with Hello_Wrapper;

procedure Taskmaster is
begin

   Hello_Wrapper.Say_Hello_From_Cpp;

   Put_Line("This message is from Ada.");
end Taskmaster;
