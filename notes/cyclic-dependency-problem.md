# Current problem

bit of a cyclic dep between etc/base, lib/core, and eventual rc generation -- we
need $SCRIPT_HOME available to do relative requires, but also need to use a
relative require to get the helper function to calculate SCRIPT_HOME.


