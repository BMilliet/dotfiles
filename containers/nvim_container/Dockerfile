FROM docker.io/library/fedora:latest

RUN dnf update -y && \
  dnf install -y zsh \
  git \
  curl \
  ripgrep \
  tmux \
  neovim \
  g++

RUN useradd -m -s /bin/zsh tofu

WORKDIR /home/tofu

USER tofu

RUN git clone https://github.com/BMilliet/kickstart.nvim.git ~/.config/nvim

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

USER root

CMD ["bash"]
