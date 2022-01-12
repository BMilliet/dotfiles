FROM docker.io/library/ubuntu:latest

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
    ripgrep

RUN mkdir -p /home/tofu/.config/nvim
COPY setups/init.vim /home/tofu/.config/nvim

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN nvim --headless +PlugInstall +qall

USER root
CMD ["bash"]
