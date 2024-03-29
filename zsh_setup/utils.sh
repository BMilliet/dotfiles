
# ZSH HELP

zhelp() {
  echo "
  ${GREEN}== general alias and commads ==${NO_COLOR}
  ${CYAN}zupdate${NO_COLOR} => update zshrc from remote
  ${CYAN}l${NO_COLOR}       => list files
  ${CYAN}gst${NO_COLOR}     => git status
  ${CYAN}gco${NO_COLOR}     => git checkout
  ${CYAN}dots${NO_COLOR}    => cd dotfiles dir
  ${CYAN}work${NO_COLOR}    => cd workspace dir
  ${CYAN}zdit${NO_COLOR}    => edit .zshrc
  ${CYAN}zso${NO_COLOR}     => source .zshrc
  ${CYAN}zcat${NO_COLOR}    => cat .zshrc
  ${CYAN}ghist${NO_COLOR}   => grep history

  ${RED}== finder ==${NO_COLOR}
  ${CYAN}psf${NO_COLOR}     => find projects (workspace and .config)
  ${CYAN}sf${NO_COLOR}      => find dir

  ${PURPLE}== docs ==${NO_COLOR}
  ${CYAN}gdoc${NO_COLOR}    => get docs
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
