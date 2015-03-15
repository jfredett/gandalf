#!/usr/bin/env bash

# configure phase


fail_unless_exists() {
  which $1 &> /dev/null || die "missing executable $1" 1
}
fail_unless() {
  eval $1 || die "failed when executing '$1', ${2:="status $!"}" 2
}

die() {
  echo $1
  exit $2
}

execute() {
  echo "Executing $1"
  INSTALL_DIR=$INSTALL_DIR bash $@
}


###

fail_unless_exists readlink
fail_unless "readlink -f $0 &>/dev/null" "readlink must support '-f'"

fail_unless_exists dirname
fail_unless_exists git

# install phase

## Collect information

[ -z $INSTALL_DIR ] && INSTALL_DIR="/home/$USER/.gandalf"

## Relocate to installed directory
cd $INSTALL_DIR

for install_script in $INSTALL_DIR/etc/install.d/* ; do
  if ! execute $install_script ; then
    die "$install_script failed, exiting" $?
  fi
done

## Finish
echo "Finished installing gandalf"
exit 0
