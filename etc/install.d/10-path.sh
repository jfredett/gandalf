#!/usr/bin/env bash

mkdir -p "$INSTALL_DIR/var/env/"

cat "$INSTALL_DIR/lib/templates/path" >> "$INSTALL_DIR/var/env/path"

