FROM docker.io/library/fedora:latest

RUN dnf update -y && \
  dnf install -y git \
  curl \
  ripgrep \
  tmux \
  neovim \
  g++ \
  zsh

RUN mkdir /home/workspace
WORKDIR /home/workspace

RUN git clone https://github.com/BMilliet/kickstart.nvim.git ~/.config/nvim
RUN git clone https://github.com/BMilliet/dotfiles.git ~/.config/dotfiles

RUN cd ~/.config/dotfiles && make set_zsh

CMD ["zsh"]
