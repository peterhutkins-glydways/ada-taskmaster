--  exception_c_wrapper.ads
pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;

package Exception_C_Wrapper is

   procedure cause_exception
   with Import => True,
        Convention => C,
        External_Name => "cause_exception";

end Exception_C_Wrapper;
