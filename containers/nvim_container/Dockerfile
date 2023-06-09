FROM docker.io/library/fedora:latest

RUN dnf update -y && \
  dnf install -y git \
  curl \
  ripgrep \
  tmux \
  neovim \
  g++ \
  zsh \
  go

RUN mkdir /home/workspace
WORKDIR /home/workspace

RUN git clone https://github.com/BMilliet/kickstart.nvim.git ~/.config/nvim
RUN git clone https://github.com/BMilliet/dotfiles.git ~/.config/dot

RUN cp ~/.config/dot/zsh_setup/.zshrc ~/.zshrc

CMD ["zsh"]

