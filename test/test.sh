#!/bin/bash

# This 'eval' exports alr's environment variables into the environment of the script.
# Specifically, it sets the PATH to find the binaries like "gnatmake"
eval $(alr -n -q printenv --unix)

# Make obj directory if it doesn't exist
mkdir -p obj

# This compiles only the one source file and its dependencies.
# Note that it does NOT apply the usual compile switches from the project file.
gnatmake -D obj -aI../src test_callables_args.adb -vh
if [ $? == 0 ]; then
  ./test_callables_args
fi
