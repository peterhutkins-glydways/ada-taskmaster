--   Callables_Argument.ads
with Ada.Strings.Bounded;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings; use Ada.Strings;

--   The problem here is that it needs a constant size no matter what the type is.
package Callables_Argument is
   type Value_Kind is (Int, Str);
   MAX_NAME_LENGTH : constant := 8;
   MAX_STRING_VALUE_LENGTH : constant := 16;

   type Arg (Kind : Value_Kind := Int) is private;
   function Create (Name : String;
                     Value : Integer) return Arg
      with Pre => Name'Length <= MAX_NAME_LENGTH;
   function Create (Name : String;
                     Value : String) return Arg
      with Pre => Name'Length <= MAX_NAME_LENGTH and Value'Length <= MAX_STRING_VALUE_LENGTH;
   --   Accessors
   function Kind (A : Arg) return Value_Kind;
   function Name (A : Arg) return String;
   function Value (A : Arg) return Integer;
   function Value (A : Arg) return String;

private
   --   Bound the size of the strings.
   package Arg_Name_String is
      new Ada.Strings.Bounded.Generic_Bounded_Length (Max => MAX_NAME_LENGTH);
   package Arg_Value_String is
      new Ada.Strings.Bounded.Generic_Bounded_Length (Max => MAX_STRING_VALUE_LENGTH);

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
      with Object_Size => 160 + MAX_NAME_LENGTH * 8 + MAX_STRING_VALUE_LENGTH * 8;
      --  160 is the size of the record, 8 is the size of each character.
end Callables_Argument;
