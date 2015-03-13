for rcfile in $INSTALL_DIR/etc/rcfiles.d/* ; do
  ln -sf $rcfile $HOME/.${rcfile##*/}
done
