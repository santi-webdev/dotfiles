#!/usr/bin/env zsh
source "${ZDOTDIR}/utils.zsh"

# Change settings based on the container.

# Actions when changing of directory
function show_context() {
  if [[ -f "/run/.containerenv" ]]; then # We are inside container.
    exa -1ah --icons --colour-scale --group-directories-first -T -L1
  else
    ls -1a
  fi
}

if [[ -f "/run/.containerenv" ]]; then # We are inside a container.
  CONTAINER_NAME=$(awk '/name=/{print $2}' FS='"' /run/.containerenv)
  PS1="%n%F{green}@%{$reset_color%}${CONTAINER_NAME}%{$reset_color%} %F{blue}%3~% %F{yellow}  %{$reset_color%}"

  PS1=$'${(r:$COLUMNS::━:)}'$PS1

  enter_venv
fi
