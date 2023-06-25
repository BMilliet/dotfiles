
# FINDER

psf() {
  result=$(find "$HOME_CONFIG" "$WORKSPACE" \( -name .git -o -name .build \) -prune -o -print | fzf)
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
      echo "${RED}not${NO_COLOR} dir or file"
    fi
  fi
}
