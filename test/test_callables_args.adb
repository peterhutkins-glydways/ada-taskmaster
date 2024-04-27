with Ada.Text_IO; use Ada.Text_IO;
with Callables_Arguments;
with Callables_Argument; use Callables_Argument; -- for Create

procedure Test_Callables_Args is

   package One_Arg is new Callables_Arguments (Max_Elements => 1);

   --   "positional aggregate cannot have one component", and therefore I need to write it like this.
   General_1Arg_Int : constant One_Arg.Args := (
      One_Arg.Args'First => Create ("Int", -11)
   );
   General_1Arg_Str : constant One_Arg.Args := (
      One_Arg.Args'First => Create ("Str", "I'm a String")
   );


   package Two_Args is new Callables_Arguments (Max_Elements => 2);

   General_2Args : constant Two_Args.Args := (
      (Create ("ID", 42)),
      (Create ("Name", "Ada"))
   );
   Max_2Args : constant Two_Args.Args := (
      (Create ("Maximum!", Integer'Last)),
      (Create ("EightIs8", "This is length16"))
   );
   --  Why is this even compilable?  It should be a compile-time error; instead it run-time errors, which is not cool.
   --  Over_Max_2Args : constant Two_Args.Args := (
   --     (Create ("More_Than_Eight", "This string has more than eight characters")),
   --     (Create ("More_Than_Eight", "I have to go to bed now like really"))
   --  );

   package Six_Args is new Callables_Arguments (Max_Elements => 6);
   General_6Args : constant Six_Args.Args := (
      (Create ("ID", 42)),
      (Create ("Name", "Ada")),
      (Create ("ID", 42)),
      (Create ("Name", "Ada")),
      (Create ("ID", 42)),
      (Create ("Name", "Ada"))
   );

begin
   One_Arg.Display_Args(General_1Arg_Int);
   One_Arg.Display_Args(General_1Arg_Str);

   Two_Args.Display_Args(General_2Args);
   Two_Args.Display_Args(Max_2Args);
   --  Two_Args.Display_Args(Over_Max_2Args);

   Six_Args.Display_Args(General_6Args);
end Test_Callables_Args;
