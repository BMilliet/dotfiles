
export EDITOR=nvim
export RCFILE=~/.zshrc
export MYDOCS=~/.mydocs/

export NO_COLOR='\033[0m'
export RED='\033[0;31m'
export CYAN='\033[0;36m'
export GREEN='\033[0;32m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export YELLOW='\033[1;33m'

# ALIAS

alias l="ls -la --color=auto"

alias gst="git status"
alias gco="git checkout"

alias zdit="$EDITOR $RCFILE"
alias zso="source $RCFILE"
alias zcat="cat $RCFILE"
alias docker=podman

# DOCS

alias ldoc="l $MYDOCS"

ndoc() {
  "$EDITOR" "$MYDOCS$1"
}

rdoc() {
  if [ -f "$MYDOCS$1" ]; then
    echo -n "${YELLOW}should remove${NO_COLOR} $MYDOCS$1? (y/n) "
    read answer

    if [[ $answer == "y" ]]; then
      echo "${RED}removing ${NO_COLOR}doc => $MYDOCS$1"
      rm "$MYDOCS$1"
    fi
  else
    echo "selected doc ${RED}does not exist"
  fi
}

gdoc() {
  ldocs | grep "$1"
}

# HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY

# COMPLETIONS
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit
_comp_options+=(globdots)

# HISTORY COMPLETION
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# CUSTOM THEME

setopt PROMPT_SUBST

git_branch() {
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [[ -n "$branch" ]]; then
    echo " %F{blue}(%F{red}$branch%F{blue})%f"
  else
    echo ""
  fi
}

is_git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "%B%F{yellow}!%b%f"
  else
    echo ""
  fi
}

PROMPT_PREFFIX_USER='%B%F{green}➜%f%b'
PROMPT_PREFFIX_ERR='%B%F{red}➜%f%b'

PROMPT_PATH='%B%F{cyan}%c%f%b'

PROMPT_PREFFIX="%B%(?.${PROMPT_PREFFIX_USER}%F{green}.${PROMPT_PREFFIX_ERR}%F{red})%f%b"

PROMPT='$PROMPT_PREFFIX $PROMPT_PATH$(git_branch)$(is_git_dirty) '

# UPDATE

zupdate() {
  cd ~/.config/dotfiles
  git pull
  cd
  cp ~/.config/dotfiles/zsh_setup/.zshrc .
  zso
}


# FINAL

echo '
 ____
< Hello! >
 ----
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
'
