--   callables_argument.adb

package body Callables_Argument is

   function Create (Name : String;
                    Value : Integer)
      return Arg is
   begin
      return (
         Kind => Int,
         Arg_Name => Arg_Name_String.To_Bounded_String (Source => Name, Drop => Error),
         Int_Value => Value)
      ;
   end Create;

   function Create (Name : String;
                    Value : String)
      return Arg is
   begin
      return (
         Kind => Str,
         Arg_Name => Arg_Name_String.To_Bounded_String (Source => Name, Drop => Error),
         Str_Value => Arg_Value_String.To_Bounded_String (Source => Value, Drop => Error)
      );
   end Create;
end Callables_Argument;
