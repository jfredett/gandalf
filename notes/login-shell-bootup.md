# Login Shell boot procedure

When opening a new shell, expect `~/.profile` to be loaded, this file is
symlinked to `~/.bash_profile`.

This file will run `~/.bashrc`, which will be linked in from
`$SCRIPT_HOME/etc/rc`, which will contain any custom scripts to be sourced, e.g.
function/alias definition files. The `rc` can count on `lib/core` and `etc/base`
to be loaded.


