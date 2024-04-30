--   sleepy_c.adb
with Interfaces.C.Strings; use Interfaces.C.Strings;

package body sleepy_c is
   procedure stub is
      argc    : constant Interfaces.C.int := 2;
      argv    : System.Address;
      args    : chars_ptr_array (0 .. 1);
      discard : Interfaces.C.int;   --  gets assigned, but never used.
      --   Fun note: unused warnings are suppressed when  the variable name contains the
      --   strings "discard, dummy, unused, ignore, junk"
   begin
      args (0) := New_String ("sleepy_c");
      args (1) := New_String ("2");
      argv     := args'Address;

      --   Beware: the 'main' symbol is already taken by Ada.
      --   Don't call 'main' or you'll restart the Ada program!
      discard := sleepy_main (argc, argv);
   end stub;
end sleepy_c;
