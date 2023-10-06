
# DOCS

alias ldoc="l $MY_DOCS"

create_my_docs() {
  if [ ! -d "$MY_DOCS" ]; then
    mkdir "$MY_DOCS"
  fi
}

gdoc() {
  $IDE $MY_DOCS
}

create_my_docs

