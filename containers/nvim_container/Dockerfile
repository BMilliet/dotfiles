FROM docker.io/library/fedora:latest

RUN dnf update -y && \
  dnf install -y git \
  curl \
  ripgrep \
  tmux \
  neovim \
  g++ \
  go

RUN mkdir /home/workspace
WORKDIR /home/workspace

RUN git clone https://github.com/BMilliet/kickstart.nvim.git ~/.config/nvim

CMD ["bash"]

