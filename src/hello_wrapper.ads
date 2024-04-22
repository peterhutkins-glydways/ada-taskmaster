pragma Profile (Ravenscar);

--  This is the simplest example of interfacing Ada with C or C++.
--  If you have no idea where to begin, start with the following:
--    gcc -c -fdump-ada-spec my_header.h
--  ...and then trim away anything that you don't need.
package Hello_Wrapper is
   procedure Say_Hello_From_Cpp
   with Import => True,
        Convention => C,
        External_Name => "say_hello_from_cpp";
end Hello_Wrapper;
