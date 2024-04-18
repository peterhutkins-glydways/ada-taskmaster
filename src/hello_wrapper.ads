pragma Profile (Ravenscar);

package Hello_Wrapper is
    procedure Say_Hello_From_Cpp;
    pragma Import(C, Say_Hello_From_Cpp, "say_hello_from_cpp");
end Hello_Wrapper;
