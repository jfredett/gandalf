# Theory of Operation

## directories/files

* `lib/`

Contains sourceable scripts which provide helper functions for defining other
scripts.

* `etc/`

Contains end-user configuration, uses `lib` scripts to help acheive
cross-distro/platform compatibility.

* `etc/rc.default`, `etc/alias.d`, and `etc/function.d`

`rc.default` is sourced in `~/.bashrc` before `etc/rc`. Its purpose is to load
all the alias files and functions files from `etc/{alias,function}.d`, in `ls`
order. This is to allow having a different files for different collections of
aliases.

* `bin/`

Executable shell scripts which use `lib` scripts to help acheive
cross-compatibility

* `install.sh`

Generic installer, creates the `~/.profile` file, executes all install scripts
in `bin/install.d` which have the form `install-<somepackage>.sh`.

### Potential additions

* `configure.sh` and `obj/`

Used in configuring the install script and storing said configuration or
intermediate artifacts. `configure.sh` would determine statically things like
`$PLATFORM` and `$DISTRO`, as well as any sort of necessary customization. It
would also ensure dependencies are met.

`obj/` would simply contain intermediate generated files for things that need
them (might be useful for manually installing AUR packages or w/e)

## basefiles

* `etc/base`

Contains basic configuration details, no executable functions. Things like
`$SCRIPT_HOME` are exported here.

* `lib/core`

Defines minimum functions for loading the rest of the configs.

