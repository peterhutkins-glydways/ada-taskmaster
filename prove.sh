#!/bin/bash

# For more command-line options, see
# https://docs.adacore.com/live/wave/spark2014/html/spark2014_ug/en/source/how_to_run_gnatprove.html#running-gnatprove-from-the-command-line

# Written out on multiple lines so that you can comment them out when (not) needed.
# --mode can be (check, check_all, flow, prove, all)
# --level influences speed and power of proof. range (0..4)
# --pedantic for warnings about possible implementation-defined behavior

alr \
gnatprove -Ptaskmaster.gpr \
  --mode=all \
  --level=1 \
  --report=all \
  --pedantic

# The gnatprove output may reference the SPARK RM to explain failures.
# e.g. "(SPARK RM 9(2)" refers to chapter 9, rule 2 in the SPARK Reference Manual.
# See: https://docs.adacore.com/spark2014-docs/html/lrm/index.html
