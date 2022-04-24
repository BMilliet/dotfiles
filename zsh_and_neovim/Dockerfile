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
    locales

RUN useradd -m -s /bin/zsh tofu
RUN locale-gen en_US.UTF-8

RUN export GEM_HOME=/home/tofu/.gem && \
    gem install bundler && \
    gem install solargraph && \
    chown -R tofu:tofu /home/tofu/.gem

USER tofu

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN mkdir -p /home/tofu/.config/nvim
COPY nvim /home/tofu/.config

RUN mkdir /home/tofu/others
RUN cd /home/tofu/others && git clone --depth=1 https://github.com/neovim/neovim
RUN cd /home/tofu/others/neovim && make

RUN echo 'export LANG=en_US.UTF-8' >> ~/.zshrc
RUN echo 'export GEM_HOME=/home/tofu/.gem' >> ~/.zshrc
RUN echo 'export PATH="/home/tofu/.gem/bin:${PATH}"' >> ~/.zshrc

USER root
RUN cd /home/tofu/others/neovim && make install

CMD ["bash"]
