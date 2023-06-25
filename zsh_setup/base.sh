
create_zsh_data() {
  if [ ! -d "$ZSH_DATA" ]; then
    mkdir "$ZSH_DATA"
  fi
}

create_workspace() {
  if [ ! -d "$WORKSPACE" ]; then
    mkdir "$WORKSPACE"
  fi
}

create_zsh_data
create_workspace

