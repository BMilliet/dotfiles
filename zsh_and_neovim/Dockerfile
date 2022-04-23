FROM ubuntu:22.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y zsh \
    git \
    curl \
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
    doxygen

RUN useradd -m -s /bin/zsh tofu

USER tofu

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN mkdir -p /home/tofu/.config/nvim
COPY setups/init.vim /home/tofu/.config/nvim

RUN mkdir /home/tofu/others
RUN cd /home/tofu/others && git clone https://github.com/neovim/neovim
RUN cd neovim && make

USER root
RUN cd /home/tofu/others/neovim && make install

USER tofu

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN nvim --headless +PlugInstall +qall

USER root
CMD ["bash"]
