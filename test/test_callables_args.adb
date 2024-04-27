with Ada.Text_IO; use Ada.Text_IO;
with Callables_Arguments;
with Callables_Argument; use Callables_Argument; -- for Create

procedure Test_Callables_Args is

   package Two_Args is new Callables_Arguments (Max_Elements => 2);

   General_Args : constant Two_Args.Args := (
      (Create ("ID", 42)),
      (Create ("Name", "Ada"))
   );
   Max_Args : constant Two_Args.Args := (
      (Create ("Maximum", Integer'Last)),
      (Create ("SevenLn", "String7"))
   );
   --  Why is this even compilable?  It should be a compile-time error; instead it run-time errors, which is not cool.
   --  Over_Max_Args : constant Two_Args.Args := (
   --     (Create ("More_Than_Seven", "String+Seven")),
   --     (Create ("More_Than_Seven", "String+7"))
   --  );

begin
   Two_Args.Display_Args(General_Args);
   Two_Args.Display_Args(Max_Args);
   --  Two_Args.Display_Args(Over_Max_Args);   -- exception thrown here!
end Test_Callables_Args;
