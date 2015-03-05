for rcfile in $INSTALL_DIR/etc/rcfiles/* ; do
  ln -sf $rcfile $HOME/.${rcfile##*/}
done
