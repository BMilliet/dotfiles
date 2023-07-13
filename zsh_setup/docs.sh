
# DOCS

alias ldoc="l $MY_DOCS"

create_my_docs() {
  if [ ! -d "$MY_DOCS" ]; then
    mkdir "$MY_DOCS"
  fi
}

ndoc() {
  if [ -z "$1" ]; then
    echo -n "${CYAN}create${NO_COLOR} new doc (name): "
    read answer
    "$EDITOR" "$MY_DOCS/$answer"
  else
    "$EDITOR" "$MY_DOCS$1"
  fi
}

rdoc() {
  if [ -f "$MY_DOCS/$1" ]; then
    echo -n "${YELLOW}should remove${NO_COLOR} $MY_DOCS/$1? (y/n) "
    read answer

    if [[ $answer == "y" ]]; then
      echo "${RED}removing ${NO_COLOR}doc => $MY_DOCS/$1"
      rm "$MY_DOCS/$1"
    fi
  else
    echo "selected doc ${RED}does not exist"
  fi
}

gdoc() {
  result=$(find "$MY_DOCS" \( -name .git -o -name .build \) -prune -o -print | fzf)
  handle_search $result
}

create_my_docs

