
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
  ldoc | grep "$1" --color
}
