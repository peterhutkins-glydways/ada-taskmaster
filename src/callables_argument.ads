--   Callables_Argument.ads
with Ada.Strings.Bounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings; use Ada.Strings;

--   The problem here is that it needs a constant size no matter what the type is.
package Callables_Argument is
   type Value_Kind is (Int, Str);

   type Arg (Kind : Value_Kind := Int) is private;
   function Create (Name : String;
                     Value : Integer) return Arg;
   function Create (Name : String;
                     Value : String) return Arg;
   --   Accessors
   function Kind (A : Arg) return Value_Kind;
   function Name (A : Arg) return String;
   function Value (A : Arg) return Integer;
   function Value (A : Arg) return String;

private
   --   Bound the size of the strings.
   package Arg_Name_String is
      new Ada.Strings.Bounded.Generic_Bounded_Length (Max => 8);
   package Arg_Value_String is
      new Ada.Strings.Bounded.Generic_Bounded_Length (Max => 8);

   --   Creates a variant record to hold the possible argument types.
   --   We want the size of this record to be known at compile time.
   --   Once specified, the object can be instantiated into
   --   arrays, etc. so that _their_ size can be known at compile time.
   --   But because the size may change depending upon what type of value
   --   it holds, we have to explicitly specify the size of the record.
type Arg (Kind : Value_Kind := Int) is record
      Arg_Name : Arg_Name_String.Bounded_String;
      case Kind is
         when Int =>
            Int_Value : Integer;
         when Str =>
            Str_Value : Arg_Value_String.Bounded_String;
      end case;
   end record
      with Object_Size => 288;
end Callables_Argument;
