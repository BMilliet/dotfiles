#### ENVS

EDITOR=nvim
WORKSPACE=~/workspace


##### ALIAS

alias docs="$EDITOR ~/.my_docs"
alias work="cd $WORKSPACE"
alias zso="source ~/.zshrc"
alias nconfig="cd ~/.config/nvim"
alias cat="bat"
alias rcat="cat"

alias vi="nvim"
alias vim="nvim"


#### FZF

psf() {
  result=$(find "$WORKSPACE" \( -name .git -o -name .build \) -prune -o -print | fzf)
  handle_search $result
}

sf() {
  result=$(find . \( -name .git -o -name .build \) -prune -o -print | fzf)
  handle_search $result
}

handle_search() {
  local result="$1"

  if [ -n "$result" ]; then
    if [ -d "$result" ]; then
      cd $result
    elif [ -f "$result" ]; then
      $EDITOR $result
    else
      echo "not dir or file"
    fi
  fi
}

source ~/.config/dotfiles/zsh_custom.sh


#### CUSTOM

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
