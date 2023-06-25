
# FINDER

psf() {
  result=$(find "$HOME_CONFIG" "$WORKSPACE" \( -name .git -o -name .build \) -prune -o -print | fzf)

  if [ -n "$result" ]; then
    cd $result
  fi
}

sf() {
  result=$(find . \( -name .git -o -name .build \) -prune -o -print | fzf)

  if [ -n "$result" ]; then
    cd $result
  fi
}
