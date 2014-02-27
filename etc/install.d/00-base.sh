#!/usr/bin/env bash

# write `rc`, `profile` to `$HOME/.bashrc` and `$HOME/.bash_profile`, adding the SCRIPT_HOME variable appropriately

source $INSTALL_DIR/lib/info

case $PLATFORM in
  LINUX)
    RC_FILES=('.bash_rc')
    PROFILE_FILES=('.bash_profile')
    ;;
  OSX)
    RC_FILES=('.bash_rc')
    PROFILE_FILES=('.profile' '.bash_profile'
    ;;
  *) echo "Unknown platform" && exit 1 ;;
esac

# write rc files
for RC_FILE in $RC_FILES ; do
  echo "export SCRIPT_HOME='$INSTALL_DIR'" > "$HOME/$RC_FILE"
  cat "$INSTALL_DIR/lib/templates/rc" > "$HOME/$RC_FILE"
done

# write profile files
for PROFILE_FILE in $PROFILE_FILES ; do
  ln -s "$INSTALL_DIR/lib/templates/profile" "$HOME/$PROFILE_FILE"
done
