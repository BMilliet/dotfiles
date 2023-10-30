
# HISTORY

HISTSIZE=1000
SAVEHIST=1000
setopt INC_APPEND_HISTORY

ghist() {
  grep --color "$1" "$HISTFILE"
}

