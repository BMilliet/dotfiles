
# ZSH HELP

zhelp() {
  echo "
  ${GREEN}== general alias and commads ==${NO_COLOR}
  ${CYAN}zupdate${NO_COLOR} => update zshrc from remote
  ${CYAN}vupdate${NO_COLOR} => update nvim config from remote
  ${CYAN}l${NO_COLOR}       => list files
  ${CYAN}gst${NO_COLOR}     => git status
  ${CYAN}gco${NO_COLOR}     => git checkout
  ${CYAN}dots${NO_COLOR}    => cd dotfiles dir
  ${CYAN}work${NO_COLOR}    => cd workspace dir
  ${CYAN}zdit${NO_COLOR}    => edit .zshrc
  ${CYAN}zso${NO_COLOR}     => source .zshrc
  ${CYAN}zcat${NO_COLOR}    => cat .zshrc
  ${CYAN}vdit${NO_COLOR}    => edit custom nvim config
  ${CYAN}cdvim${NO_COLOR}   => cd nvim config dir
  ${CYAN}docker${NO_COLOR}  => podman
  ${CYAN}ghist${NO_COLOR}   => grep history

  ${RED}== finder ==${NO_COLOR}
  ${CYAN}psf${NO_COLOR}     => find projects (workspace and .config)
  ${CYAN}psg${NO_COLOR}     => find file in projects (workspace and .config)
  ${CYAN}sf${NO_COLOR}      => find dir
  ${CYAN}sg${NO_COLOR}      => find file

  ${PURPLE}== docs ==${NO_COLOR}
  ${CYAN}ldoc${NO_COLOR}    => list docs
  ${CYAN}ndoc${NO_COLOR}    => create new doc
  ${CYAN}rdoc${NO_COLOR}    => remove doc
  ${CYAN}gdoc${NO_COLOR}    => get doc
  "
}

# UPDATE

zupdate() {
  cd $DOTFILES
  git pull
  make set_zsh
  cd
  zso
}

vupdate() {
  cd $NVIM_HOME
  git pull
  cd
}
