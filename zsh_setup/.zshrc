
#export EDITOR=vim
export EDITOR=nvim

# ALIAS

alias l="ls -la --color=auto"

alias gst="git status"
alias gco="git checkout"

alias zdit="$EDITOR ~/.zshrc"
alias zso="source ~/.zshrc"
alias zcat="cat ~/.zshrc"

alias docker=podman

# COMPLETIONS

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit
_comp_options+=(globdots)

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
