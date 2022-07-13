FROM ubuntu:22.04

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
    locales \
    libsqlite3-dev

RUN useradd -m -s /bin/zsh tofu
RUN locale-gen en_US.UTF-8

RUN export GEM_HOME=/home/tofu/.gem && \
    gem install bundler && \
    gem install solargraph && \
    chown -R tofu:tofu /home/tofu/.gem

USER tofu

RUN mkdir -p /home/tofu/.config

RUN git clone https://github.com/BMilliet/nvim.git /home/tofu/.config/nvim

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN mkdir /home/tofu/others
RUN cd /home/tofu/others && git clone https://github.com/neovim/neovim
RUN cd /home/tofu/others/neovim && \
    git checkout stable && \
    make CMAKE_BUILD_TYPE=Release

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

RUN echo 'export LANG=en_US.UTF-8' >> ~/.zshrc
RUN echo 'export GEM_HOME=/home/tofu/.gem' >> ~/.zshrc
RUN echo 'export PATH="/home/tofu/.gem/bin:${PATH}"' >> ~/.zshrc
RUN echo 'export PATH="/home/tofu/others/swift/swift-5.6.1-RELEASE-ubuntu20.04-aarch64/usr/bin:${PATH}"' >> ~/.zshrc
RUN echo 'export PATH="/home/tofu/others/dart/dart-sdk/bin:${PATH}"' >> ~/.zshrc
RUN echo 'export PATH="/home/tofu/others/neovim/build/bin:${PATH}"' >> ~/.zshrc

USER root

CMD ["bash"]
