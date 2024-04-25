--  sleepy_c.ads
--  Wrapper for sleepy.c

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;

package sleepy_c is

  procedure stub;
  -- Header file for sleep()
  function sleepy_main (argc : int; argv : System.Address) return int  -- sleepy.c:5
    with Import => True,
      Convention => C,
      External_Name => "sleepy_main";

  -- Convert the argument to an integer
  -- POSIX sleep function
end sleepy_c;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
