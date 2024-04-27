--   callables_argument.adb

package body Callables_Argument is

   --  Instantiation variants for the Arg record type
   function Create (Name : String; Value : Integer)
      return Arg is
   begin
      return (
         Kind => Int,
         Arg_Name => Arg_Name_String.To_Bounded_String (Source => Name, Drop => Error),
         Int_Value => Value);
   end Create;

   function Create (Name : String; Value : String)
      return Arg is
   begin
      return (
         Kind => Str,
         Arg_Name => Arg_Name_String.To_Bounded_String (Source => Name, Drop => Error),
         Str_Value => Arg_Value_String.To_Bounded_String (Source => Value, Drop => Error));
   end Create;

   --   Accessor functions for the Arg record type
   function Kind (A : Arg) return Value_Kind is
   begin
      return A.Kind;
   end Kind;

   function Name (A : Arg) return String is
   begin
      return Arg_Name_String.To_String (Source => A.Arg_Name);
   end Name;

   function Value (A : Arg) return Integer is
   begin
      return A.Int_Value;
   end Value;

   function Value (A : Arg) return String is
   begin
      return Arg_Value_String.To_String (Source => A.Str_Value);
   end Value;

end Callables_Argument;