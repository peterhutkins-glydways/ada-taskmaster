--  sleepy_c.ads
--  Wrapper for sleepy.c

with Interfaces.C; use Interfaces.C;
with System;

package Sleepy_C is

   procedure Stub;
   -- Header file for sleep()
   function Sleepy_Main (Argc : int;
      Argv : System.Address)
      return int  -- sleepy.c:5
   with
      Import => True, Convention => C, External_Name => "sleepy_main";

   -- Convert the argument to an integer
   -- POSIX sleep function
end Sleepy_C;
