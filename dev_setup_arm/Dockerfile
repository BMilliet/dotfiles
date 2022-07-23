FROM ubuntu:latest

RUN apt update && \
  apt upgrade -y && \
  apt install -y zsh \
  git \
  curl \
  libssl-dev \
  ripgrep \
  ninja-build \
  gettext \
  libtool \
  libtool-bin \
  autoconf \
  automake \
  cmake \
  g++ \
  pkg-config \
  unzip \
  doxygen \
  ruby-full \
  libsqlite3-dev \
  pip

RUN useradd -m -s /bin/zsh tofu

WORKDIR /home/tofu

USER tofu

RUN mkdir -p /home/tofu/.config
RUN mkdir -p /home/tofu/others

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN cd /home/tofu/others && git clone https://github.com/neovim/neovim
RUN cd /home/tofu/others/neovim && \
  git checkout stable && \
  make CMAKE_BUILD_TYPE=Release

USER root

RUN cd /home/tofu/others/neovim && \
  make install

USER tofu

RUN mkdir /home/tofu/others/swift && \
  cd /home/tofu/others/swift && \
  curl https://download.swift.org/swift-5.6.1-release/ubuntu2004-aarch64/swift-5.6.1-RELEASE/swift-5.6.1-RELEASE-ubuntu20.04-aarch64.tar.gz -O -L && \
  tar xzf swift-5.6.1-RELEASE-ubuntu20.04-aarch64.tar.gz && \
  rm -f swift-5.6.1-RELEASE-ubuntu20.04-aarch64.tar.gz

RUN mkdir /home/tofu/others/dart && \
  cd /home/tofu/others/dart && \
  curl https://storage.googleapis.com/dart-archive/channels/stable/release/2.17.3/sdk/dartsdk-linux-arm64-release.zip -O -L && \
  unzip dartsdk-linux-arm64-release.zip && \
  rm -f dartsdk-linux-arm64-release.zip

RUN mkdir /home/tofu/others/node && \
  cd /home/tofu/others/node && \
  curl https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-arm64.tar.xz -O -L && \
  tar -xJf node-v16.16.0-linux-arm64.tar.xz && \
  rm -rf node-v16.16.0-linux-arm64.tar.xz

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN source "$HOME/.cargo/env"
RUN cargo install tree-sitter-cli

RUN echo 'export PATH="/home/tofu/others/swift/swift-5.6.1-RELEASE-ubuntu20.04-aarch64/usr/bin:${PATH}"' >> ~/.zshrc
RUN echo 'export PATH="/home/tofu/others/dart/dart-sdk/bin:${PATH}"' >> ~/.zshrc
RUN echo 'export PATH="/home/tofu/others/node/node-v16.16.0-linux-arm64/bin:${PATH}"' >> ~/.zshrc

RUN source /home/tofu/.zshrc && \
  printf 'n\ny\ny\n' | /bin/bash -c "$(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)"

USER root

CMD ["bash"]
