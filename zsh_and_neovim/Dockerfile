FROM ubuntu:22.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y zsh \
    git \
    curl \
    neovim \
    ripgrep

RUN useradd -m -s /bin/zsh tofu

USER tofu

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN mkdir -p /home/tofu/.config/nvim
COPY setups/init.vim /home/tofu/.config/nvim

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN nvim --headless +PlugInstall +qall

USER root
CMD ["bash"]
