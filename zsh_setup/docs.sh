
# DOCS

alias ldoc="l $MY_DOCS"

ndoc() {
  "$EDITOR" "$MY_DOCS$1"
}

rdoc() {
  if [ -f "$MY_DOCS$1" ]; then
    echo -n "${YELLOW}should remove${NO_COLOR} $MY_DOCS$1? (y/n) "
    read answer

    if [[ $answer == "y" ]]; then
      echo "${RED}removing ${NO_COLOR}doc => $MY_DOCS$1"
      rm "$MY_DOCS$1"
    fi
  else
    echo "selected doc ${RED}does not exist"
  fi
}

gdoc() {
  ldoc | grep "$1" --color
}
