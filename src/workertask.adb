with Ada.Real_Time; use Ada.Real_Time;
with Ada.Task_Identification;
with Libhello;

task type WorkerTask is
    entry Start (Timeout : Ada.Real_Time.Time_Span);
end Worker_Task;

task body Worker_Task is
    Task_Start : Time;
    Deadline : Time;
begin
    accept Start (Timeout : Time_Span) do
        Task_Start := Clock;
        Deadline := Task_Start + Timeout;
    end Start;

    -- Call the C function
    Libhello.Hello_World;

    -- Check timeout
    if Clock > Deadline then
        -- Handle timeout, e.g., by logging or cleanup
        null; -- Placeholder for timeout handling
    end if;
end Worker_Task;