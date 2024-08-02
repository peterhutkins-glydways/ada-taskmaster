--   sleepy_c.adb

--  pragma Style_Checks (Off);

with Interfaces.C.Strings; use Interfaces.C.Strings;

package body Sleepy_C is
   procedure Stub is
      Argc    : constant Interfaces.C.int := 2;
      Argv    : System.Address;
      Args    : chars_ptr_array (0 .. 1);
      Discard : Interfaces.C.int;   --  gets assigned, but never used.
      --   Ada learning note: unused warnings are suppressed when  the variable name contains the
      --   strings "discard, dummy, unused, ignore, junk"
   begin
      --   TODO:  Get args from the Trigger
      Args (0) := New_String ("sleepy_c");
      Args (1) := New_String ("5000");
      Argv     := Args'Address;

      --   Beware: the 'main' symbol is already taken by Ada.
      --   Don't call 'main' or you'll restart the Ada program!
      Discard := Sleepy_Main (Argc, Argv);
   end Stub;
end Sleepy_C;
