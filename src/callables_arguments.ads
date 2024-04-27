--  Callables_Arguments.ads

with Callables_Argument; use Callables_Argument;

generic
    Max_Elements : Positive;
package Callables_Arguments is
    type Args is array (1 .. Max_Elements) of Arg;

    procedure Display_Args (Data : Args);
end Callables_Arguments;
