--   Callables_Argument.ads
with Ada.Strings.Bounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings; use Ada.Strings;

--   The problem here is that it needs a constant size no matter what the type is.
package Callables_Argument is
   type Value_Kind is (Int, Str);

   package Arg_Name_String is
      new Ada.Strings.Bounded.Generic_Bounded_Length (Max => 7);
   package Arg_Value_String is
      new Ada.Strings.Bounded.Generic_Bounded_Length (Max => 7);

   --   Create a variant record to hold the possible argument types.
   type Arg (Kind : Value_Kind := Int) is record
      Arg_Name : Arg_Name_String.Bounded_String;
      case Kind is
         when Int =>
            Int_Value : Integer;
         when Str =>
            Str_Value : Arg_Value_String.Bounded_String;
      end case;
   end record
      --   We have to specify the size of the variant record so that it
      --   can be known at compile time.
      --   Once specified, the object can be instantiated into
      --   arrays, etc. so that _their_ size can be known at compile time.
      with Object_Size => 288;

   function Create (Name : String;
                     Value : Integer) return Arg;
   function Create (Name : String;
                     Value : String) return Arg;
end Callables_Argument;
