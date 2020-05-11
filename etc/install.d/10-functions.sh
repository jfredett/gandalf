#!/usr/bin/env bash

mkdir -p "$INSTALL_DIR/var/env/"

cat "$INSTALL_DIR/lib/templates/functions" > "$INSTALL_DIR/var/env/functions"
