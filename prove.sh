#!/bin/bash

# For more command-line options, see
# https://docs.adacore.com/live/wave/spark2014/html/spark2014_ug/en/source/how_to_run_gnatprove.html#running-gnatprove-from-the-command-line

# Written out on multiple lines so that you can comment them out when (not) needed.
alr \
gnatprove -Ptaskmaster.gpr \
  --mode=prove \
  --level=1 \
  --report=all \
  --pedantic
