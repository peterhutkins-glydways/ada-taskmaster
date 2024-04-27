#!/bin/bash

gnatmake -D obj -aI../src test_callables_args.adb -vh
if [ $? == 0 ]; then
  ./test_callables_args
fi
