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

ARGS=($@)
while [ "$ARGS" ] ; do
  curr=${ARGS[0]}
  ARGS=(${ARGS[@]:1})

  case $curr in
    --git)
        GIT_URL=${ARGS[0]}
        ARGS=(${ARGS[@]:1})
      ;;
    --install)
        INSTALL_DIR=${ARGS[0]}
        ARGS=(${ARGS[@]:1})
      ;;
    *) echo "Bad Options" ; exit 2 ;;
  esac
done

[ -z $INSTALL_DIR ] && INSTALL_DIR="/home/$USER/.gandalf"
[ -z $GIT_URL ] && GIT_URL="git clone http://github.com/jfredett/gandalf.git"

echo "Installing to $INSTALL_DIR"
echo "Cloning from $GIT_URL"
if ! $GIT_URL $INSTALL_DIR ; then
  echo "Failed to clone, exiting"
  exit 4
fi

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
