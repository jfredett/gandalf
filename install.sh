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

###

fail_unless_exists readlink
fail_unless "readlink -f $0 &>/dev/null" "readlink must support '-f'"

fail_unless_exists dirname

################################################################################
## install phase

# write out rc/profile files.

cat <<EOF
source $HOME/$(dirname $(readlink -f $0))/lib/core
EOF
