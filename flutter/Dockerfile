FROM docker.io/library/ubuntu:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y curl

RUN useradd -m -s /bin/bash flutter_user

USER flutter_user

RUN mkdir flutter_app && mkdir apps

RUN cd apps && \
    curl https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.10.1-stable.tar.xz -O -L && \
    tar -xJf flutter_linux_2.10.1-stable.tar.xz
    rm -rf flutter_linux_2.10.1-stable.tar.xz

ENV PATH="${PATH}:/home/flutter_user/apps/flutter/bin"

WORKDIR /home/flutter_user/flutter_app

CMD ["bash"]
