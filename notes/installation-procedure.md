# How to install configs

Run `./install.sh (path_to_installation)`, if Path is given, install there,
otherwise default to install in `~/.gandalf`

install.sh should run, in `ls` order, all the files in `install.d`, passing
along the installation path provided as the environment variable `INSTALL_DIR`

in etc/install.d there will be scripts to link up each thing.
