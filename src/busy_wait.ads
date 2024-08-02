-- busy_wait.ads

-- Ravenscar prevents relative delays, so we can't use the 'delay' statement.
-- But instead, we can busy-wait for a while.

package Busy_Wait is
   procedure Busy_Wait;
end Busy_Wait;
