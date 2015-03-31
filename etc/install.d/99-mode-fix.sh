#!/usr/bin/env bash

# this ensures that all binfiles are set to be executable even when git fails to
# preserve that information. Fixes a bug noticed when trying to use gandalf on a
# Debian VM

find $INSTALL_DIR/bin -type f -exec chmod a+x {} \;
