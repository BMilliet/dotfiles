FROM ubuntu:latest

RUN apt update && \
  apt upgrade -y && \
  apt install -y zsh \
  git \
  curl \
  sudo \
  build-essential

RUN useradd -m -s /bin/zsh tofu && \
  usermod -aG sudo tofu && \
  mkdir -p /home/linuxbrew/.linuxbrew && \
  chown -R tofu: /home/linuxbrew/.linuxbrew

WORKDIR /home/tofu

USER tofu
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

USER root
RUN deluser tofu sudo

USER tofu
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/tofu/.zshrc

ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

RUN brew install gcc \
  git \
  curl \
  neovim \
  ripgrep \
  python \
  node \
  rust

RUN printf 'n\ny\ny\n' | /bin/bash -c "$(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)"
RUN echo 'export PATH=/home/tofu/.cargo/bin:/home/tofu/.local/bin:$PATH' >> /home/tofu/.zshrc

USER root
CMD ["bash"]
