#!/usr/bin/env bash

if [ "$1" = "on" ] ; then

cat > ~/.bash_profile <<HERE
set -x
source ~/.bash_rc
set +x
HERE

else
  rm ~/.bash_profile
fi
