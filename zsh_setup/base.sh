
create_zsh_data() {
  if [ ! -d "$ZSH_DATA" ]; then
    mkdir "$ZSH_DATA"
  fi
}

create_zsh_data

