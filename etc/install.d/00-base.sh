#!/usr/bin/env bash

# write `rc`, `profile` to `$HOME/.bashrc` and `$HOME/.bash_profile`, adding the SCRIPT_HOME variable appropriately
source $INSTALL_DIR/lib/info

# write rc files
for RC_FILE in $RC_FILES ; do
  echo "#!/usr/bin/env bash" > "$HOME/$RC_FILE"
  echo "export SCRIPT_HOME='$INSTALL_DIR'" >> "$HOME/$RC_FILE"
  cat "$INSTALL_DIR/lib/templates/rc" >> "$HOME/$RC_FILE"
done

# write profile files
for PROFILE_FILE in $PROFILE_FILES ; do
  echo "#!/usr/bin/env bash" > "$HOME/$PROFILE_FILE"
  echo "export SCRIPT_HOME='$INSTALL_DIR'" > "$HOME/$PROFILE_FILE"
  cat "$INSTALL_DIR/lib/templates/profile" >> "$HOME/$PROFILE_FILE"
done
