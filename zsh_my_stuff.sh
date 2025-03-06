#### ENVS

export LANG=en_US.UTF-8

EDITOR=nvim
WORKSPACE=~/workspace


##### ALIAS

alias docs="$EDITOR ~/.my_docs"
alias work="cd $WORKSPACE"
alias zso="source ~/.zshrc"
alias nconfig="cd ~/.config/nvim && nvim"
alias dotconfig="cd ~/.config/dotfiles && nvim"
alias cat="bat"
alias vi="nvim"
alias vim="nvim"

alias add_custom="nvim ~/.config/dotfiles/zsh_custom.sh"

alias swift_init="swift package init --type executable"

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
      cd "$result"
    elif [ -f "$result" ]; then
      $EDITOR "$result"
    else
      echo -e "\033[1;31mError: Not a directory or file.\033[0m"
    fi
  else
    echo -e "\033[1;31mError: No result provided.\033[0m"
  fi
}

zhelp() {
  echo ""
  echo -e "\033[1;34m#### Help: Commands and Aliases ####\033[0m"
  echo ""
  echo -e "\033[1;35m 🚀 Available Aliases:\033[0m"
  echo -e "\033[1;36m  docs                              \033[0m- Open personal documents with $EDITOR"
  echo -e "\033[1;36m  work                              \033[0m- Go to the workspace directory ($WORKSPACE)"
  echo -e "\033[1;36m  zso                               \033[0m- Reload the ~/.zshrc file"
  echo -e "\033[1;36m  nconfig                           \033[0m- Open Neovim configuration"
  echo -e "\033[1;36m  dotconfig                         \033[0m- Open dotfiles configuration"
  echo -e "\033[1;36m  cat                               \033[0m- Replace 'cat' with the 'bat' command"
  echo -e "\033[1;36m  vi                                \033[0m- Replace 'vi' with $EDITOR"
  echo -e "\033[1;36m  vim                               \033[0m- Replace 'vim' with $EDITOR"
  echo -e "\033[1;36m  add_custom                        \033[0m- Edit zsh customizations file"
  echo -e "\033[1;36m  swift new package (executable)    \033[0m- Init new swift executable package"
  echo ""
  echo -e "\n\033[1;35m 🧰 Available Functions:\033[0m"
  echo -e "\033[1;36m  psf         \033[0m- Search for files in the workspace ($WORKSPACE) using fzf"
  echo -e "\033[1;36m  sf          \033[0m- Search for files in the current directory using fzf"
  echo ""
  echo -e "\033[1;34m#### End of Help ####\033[0m"
  echo ""
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

