#!/usr/bin/env bash

mkdir -p "$INSTALL_DIR/var/"

cat "$INSTALL_DIR/lib/templates/env_loader" >> "$INSTALL_DIR/var/env_loader"
