#!/usr/bin/env bash

# We need to know about the ENV to know what to build, but we want to do this
# all at once at 'compile' time.
# XXX: This is a bit hacky, the script_home/install_dir distinction is probably
# meaningless and can be removed.
SCRIPT_HOME=$INSTALL_DIR
source $SCRIPT_HOME/lib/core
require lib/info
require var/env_loader

declare -a prompt_arr

for component in ${PROMPT_COMPONENTS[*]} ; do
  pos=$($component::ps1_position)


  if [ "${prompt_arr["$pos"]}" ] ; then
    echo "Position $pos is occupied by ${prompt_arr["$pos"]}, move the $component element to another position"
    exit 10
  fi

  color_args="$($component::ps1_color)"
  if [ -z "$color_args" ] ; then
    cmd="$component::ps1_content | paren_wrap"
  else
    cmd="$component::ps1_content | color `$component::ps1_color` | paren_wrap"
  fi

  if $component::ps1_cacheable ; then
    content="$($cmd)"
  else
    content="\$($cmd)"
  fi

  prompt_arr[$pos]="$content"
done

cat<<-HERE > $INSTALL_DIR/var/ps1
ps1() {
  export PS1="${prompt_arr[@]}\n\$PROMPT_FOB "
}

export PROMPT_COMMAND='ps1'
HERE
