# How to install configs

Run `./install.sh (path_to_installation)`, if Path is given, install there,
otherwise default to install in `~/.gandalf`

install.sh should run, in `ls` order, all the files in `install.d`, passing
along the installation path as the first (and only) parameter

in etc/install.d there will be scripts to link up each thing.